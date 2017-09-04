module Picobox
  module Shell
    class DotProfile
      attr_reader :os

      def initialize(os)
        @os = os
      end

      def install_extensions
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
        "#{os.home_dir}/.profile"
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
