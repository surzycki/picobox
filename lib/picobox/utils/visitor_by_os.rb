module Picobox
  module Utils
    class VisitorByOs
      include Utils::DomainEventPublisher

      def visit subject
        @os = subject.os
        method_name = "visit_#{os.to_s}".intern
        send(method_name, subject )
      end

      def visit_darwin subject
        raise ::NotImplementedError, 'mac not supported'
      end

      def visit_linux subject
        raise ::NotImplementedError, 'linux not supported'
      end

      def visit_windows subject
        raise ::NotImplementedError, 'windows not supported'
      end

      def visit_unsupported subject
        raise Errors::UnsupportedOsError, "#{TTY::Platform.new.os} is not yet supported :("
      end

      protected
      attr_reader :os
    end
  end
end
