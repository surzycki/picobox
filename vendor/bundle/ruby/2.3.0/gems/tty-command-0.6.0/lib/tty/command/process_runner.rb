# encoding: utf-8
# frozen_string_literal: true

require 'thread'

require_relative 'execute'
require_relative 'result'
require_relative 'truncator'

module TTY
  class Command
    class ProcessRunner
      include Execute

      # the command to be spawned
      attr_reader :cmd

      # Initialize a Runner object
      #
      # @param [Printer] printer
      #   the printer to use for logging
      #
      # @api private
      def initialize(cmd, printer)
        @cmd     = cmd
        @timeout = cmd.options[:timeout]
        @input   = cmd.options[:input]
        @signal  = cmd.options[:signal] || :TERM
        @printer = printer
        @threads = []
        @lock    = Mutex.new
      end

      # Execute child process
      # @api public
      def run!(&block)
        @printer.print_command_start(cmd)
        start = Time.now
        runtime = 0.0

        pid, stdin, stdout, stderr = spawn(cmd)

        # write and read streams
        write_stream(stdin)
        stdout_data, stderr_data = read_streams(stdout, stderr, &block)

        status = waitpid(pid)
        runtime = Time.now - start

        @printer.print_command_exit(cmd, status, runtime)

        Result.new(status, stdout_data, stderr_data, runtime)
      rescue
        terminate(pid)
        Result.new(-1, stdout_data, stderr_data)
      ensure
        [stdin, stdout, stderr].each { |fd| fd.close if fd && !fd.closed? }
      end

      # Stop a process marked by pid
      #
      # @param [Integer] pid
      #
      # @api public
      def terminate(pid)
        ::Process.kill(@signal, pid) rescue nil
      end

      private

      # @api private
      def handle_timeout(runtime)
        return unless @timeout

        t = @timeout - runtime
        raise TimeoutExceeded if t < 0.0
      end

      # @api private
      def write_stream(stdin)
        return unless @input
        writers = [stdin]
        start = Time.now

        # wait when ready for writing to pipe
        _, writable = IO.select(nil, writers, writers, @timeout)
        raise TimeoutExceeded if writable.nil?

        while writers.any?
          writable.each do |fd|
            begin
              err   = nil
              size  = fd.write(@input)
              @input = @input.byteslice(size..-1)
            rescue Errno::EPIPE => err
            end
            if err || @input.bytesize == 0
              writers.delete(stdin)
            end

            # control total time spent writing
            runtime = Time.now - start
            handle_timeout(runtime)
          end
        end
      end

      # Read stdout & stderr streams in the background
      #
      # @param [IO] stdout
      # @param [IO] stderr
      #
      # @api private
      def read_streams(stdout, stderr, &block)
        stdout_data = []
        stderr_data = Truncator.new

        print_out = -> (cmd, line) { @printer.print_command_out_data(cmd, line) }
        print_err = -> (cmd, line) { @printer.print_command_err_data(cmd, line) }

        stdout_yield = -> (line) { block.(line, nil) if block }
        stderr_yield = -> (line) { block.(nil, line) if block }

        @threads << read_stream(stdout, stdout_data, print_out, stdout_yield)
        @threads << read_stream(stderr, stderr_data, print_err, stderr_yield)

        @threads.each do |th|
          result = th.join(@timeout)
          if result.nil?
            @threads[0].raise
            @threads[1].raise
          end
        end

        [stdout_data.join, stderr_data.read]
      end

      def read_stream(stream, data, print_callback, callback)
        Thread.new do
          Thread.current[:cmd_start] = Time.now
          begin
            while (line = stream.gets)
              @lock.synchronize do
                data << line
                callback.(line)
                print_callback.(cmd, line)
              end

              # control total time spent reading
              runtime = Time.now - Thread.current[:cmd_start]
              handle_timeout(runtime)
            end
          rescue => err
            raise err
          ensure
            stream.close
          end
        end
      end

      # @api private
      def waitpid(pid)
        ::Process.waitpid(pid, Process::WUNTRACED)
        $?.exitstatus
      rescue Errno::ECHILD
        # In JRuby, waiting on a finished pid raises.
      end
    end # ProcessRunner
  end # Command
end # TTY
