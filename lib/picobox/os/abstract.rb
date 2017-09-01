module Picobox
  module Os
    class Abstract
      class << self
        def tmp_dir()     '/tmp'           end
        def home_dir()    "#{ENV['HOME']}" end
        def current_dir() `pwd`.strip      end
        def config_dir()  "#{home_dir}/#{Picobox::CONFIG_DIR}" end

        def shell_extensions() "#{config_dir}/#{Picobox::SHELL_EXTENSIONS}" end

        # download and install
        def docker_filename()    end
        def docker_url()         end
        def docker_installer()   end
        def docker_installed?()  end

        def docker_version?() `docker --version` end
        def user_shell()      "#{ENV['SHELL']}"  end

        def to_s() raise ::NotImplementedError, 'must override to_s' end

        def project_root()
          Utils::Project.new(self).root
        end
      end
    end
  end
end