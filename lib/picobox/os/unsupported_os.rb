module Picobox
  module Os
    class UnsupportedOs
      class << self
        def tmp_dir()     end
        def home_dir()    end
        def current_dir() end
        def picobox_dir() end

        def docker_filename()   end
        def docker_url()        end
        def docker_fullpath()   end
        def docker_installed?() end
        def docker_version?()   end

        def user_shell() end

        def picobox_proxies() end

        def is_project?()       end
        def to_s() :unsupported end
      end
    end
  end
end
