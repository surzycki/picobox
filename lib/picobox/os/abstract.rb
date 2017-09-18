module Picobox
  module Os
    class Abstract
      class << self
        def tmp_dir()     '/tmp'           end
        def home_dir()    "#{ENV['HOME']}" end
        def current_dir() `pwd`.strip      end
        def config_dir()  "#{home_dir}/#{Picobox::CONFIG_DIR}" end

        def shell_extensions() "#{config_dir}/#{Picobox::SHELL_EXTENSIONS}" end
        def user_shell()       "#{ENV['SHELL']}"  end

        # download and install
        def docker_filename()    end
        def docker_url()         end
        def docker_installer()   end
        def docker_installed?()  end

        def docker_version?()         `docker --version`.strip end
        def docker_compose_version?() `docker-compose --version`.strip end
        
        def to_s() raise ::NotImplementedError, 'must override to_s' end

        def project_root() Utils::Project.new(self).root end
        def reload_shell() system("exec #{user_shell} -l") end
      end
    end
  end
end