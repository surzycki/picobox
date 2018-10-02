module Picobox
  module Shell
    class StartupScript
      class << self
        def get(os)
          case "#{os.user_shell}:#{os.to_s}"
          when /\/bin\/bash:darwin/, /\/bin\/bash:linux/
            Shell::Bash.new(os)
          when /\/bin\/zsh:darwin/, /\/bin\/zsh:linux/
            Shell::Zsh.new(os)
          else
            raise Errors::ShellNotSupported, "#{os.user_shell}:#{os.to_s}"
          end
        end
      end

      attr_reader :os

      def initialize(os)
        @os = os
      end

      def install_extensions
        source  = "#{os.extensions_dir}/extensions.bash"
        dest    = os.shell_extensions

        TTY::File.copy_file source, dest

        TTY::File.append_to_file(
          filename,
          "\n#{extension}\n"
          )
      end


      def uninstall_extensions
        TTY::File.gsub_file filename, /#{Regexp.escape(extension)}/ do
          "# picobox removed #{Time.now}"
        end
      end


      def filename
        raise ::NotImplementedError, 'must have filename'
      end

      private
      def extension
        "# added by picobox\nsource #{os.shell_extensions}"
      end
    end
  end
end
