module Picobox
  module Shell
    class DotBashRC < StartupScript
      def filename
        "#{os.home_dir}/.bashrc"
      end
    end
  end
end
