module Picobox
  module Shell
    class DotProfile < StartupScript
      def filename
        "#{os.home_dir}/.profile"
      end
    end
  end
end
