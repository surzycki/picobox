module Picobox
  module Shell
    class StartupScript
      class << self
        def get(os)
          case "#{os.user_shell}:#{os.to_s}"
          when '/bin/bash:darwin'
            Shell::DotProfile.new(os)
          when '/bin/zsh:darwin'
            Shell::DotZshrc.new(os)
          when '/bin/bash:linux'
            Shell::DotBashRC.new(os)
          else
            raise Errors::ShellNotSupported, "#{os.user_shell}:#{os.to_s}"
          end
        end
      end
    end
  end
end