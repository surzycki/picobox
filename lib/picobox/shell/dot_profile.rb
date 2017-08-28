module Picobox
  module Shell
    class DotProfile
      attr_reader :os

      def initialize(os)
        @os = os
      end

      def install_proxies
        TTY::File.append_to_file(path, "\n# added by picobox\nsource ~/#{os.picobox_proxies}\n")
      end

      def path
        "#{os.home_dir}/.profile"
      end
    end
  end
end