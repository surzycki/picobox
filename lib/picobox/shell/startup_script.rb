module Picobox
  module Shell
    class StartupScript
      class << self
        def get(os)
          case "#{os.user_shell}:#{os.to_s}"
          when /\/bin\/bash:darwin/
            Shell::DotProfile.new(os)
          when /\/bin\/zsh:darwin/, /\/bin\/zsh:linux/
            Shell::DotZshRC.new(os)
          when /\/bin\/bash:linux/
            Shell::DotBashRC.new(os)
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
        source  = "#{Picobox.extensions_dir}/extensions.bash"
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
      def source_file
        "~/#{Picobox::CONFIG_DIR}/#{Picobox::SHELL_EXTENSIONS}"
      end

      def extension
        "# added by picobox\nsource #{source_file}"
      end
    end
  end
end