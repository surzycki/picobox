module Picobox
  module Os
    class Darwin < Abstract
      class << self
        # download and install
        def docker_filename() 'Docker.dmg' end
        def docker_url()       "https://download.docker.com/mac/stable/#{docker_filename}" end
        def docker_installer() "#{tmp_dir}/#{docker_filename}" end

        def docker_installed?()        File.exist?('/Applications/Docker.app') end
        def docker_compose_installed() true end

        def distro() :darwin end
        def su()     Os::Distro.su(self) end

        def to_s() :darwin end
      end
    end
  end
end
