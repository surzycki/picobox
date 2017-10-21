module Picobox
  module Shell
    class Zsh < StartupScript
      def filename
        "#{os.home_dir}/.zshrc"
      end
    end
  end
end
