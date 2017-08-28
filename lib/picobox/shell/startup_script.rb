module Picobox
  module Shell
    class StartupScript
      class << self
        def get(os)
          case "#{os.user_shell}:#{os.to_s}"
          when '/bin/bash:darwin'
            Picobox::Shell::DotProfile.new(os)
          else
            raise ::NotImplementedError, "shell unsupported #{os.user_shell}:#{os.to_s}"
          end
        end
      end
    end
  end
end