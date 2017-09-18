module Picobox
  module Shell
    class DotZshRC < StartupScript
      def filename
        "#{os.home_dir}/.zshrc"
      end
    end
  end
end
