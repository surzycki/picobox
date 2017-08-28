module Picobox
  module Utils
    class ShellStartupScript
      class << self
        def get(os)
          case "#{os.user_shell}:#{os.to_s}"
          when '/bin/bash:darwin'
            Picobox::Shell::Profile.new(os)
          else
            raise ::NotImplementedError, "shell unsupported #{os.user_shell}:#{os.to_s}"
          end
        end
      end
    end
  end
end