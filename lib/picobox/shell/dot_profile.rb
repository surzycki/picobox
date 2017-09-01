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
          "\n# added by picobox\nsource #{source_file}\n"
          )
      end

      def filename
        "#{os.home_dir}/.profile"
      end

      private
      def source_file
        "~/#{Picobox::CONFIG_DIR}/#{Picobox::SHELL_EXTENSIONS}"
      end
    end
  end
end
