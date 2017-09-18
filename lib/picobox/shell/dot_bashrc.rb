module Picobox
  module Shell
    class DotBashRC
      attr_reader :os

      def initialize(os)
        @os = os
      end

      def install_extensions
        source  = "#{Picobox.template_dir}/shell_extensions.bash"
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
        "#{os.home_dir}/.bashrc"
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
