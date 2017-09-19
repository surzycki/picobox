module Picobox
  module Os
    class Linux < Abstract
      class << self
        def to_s() :linux end

        def docker_installed?()         TTY::Which.exist?('docker') end
        def docker_compose_installed?() TTY::Which.exist?('docker-compose') end

        def docker_compose_url() "https://github.com/docker/compose/releases/download/1.16.1/docker-compose-Linux-#{self.arch}" end
        def docker_compose()     "/usr/local/bin/docker-compose" end

      	def release() `lsb_release -cs`.strip  end
        def kernel()  `uname -r`.strip  end
        def arch()    `uname -m`.strip end
       	def distro()  Os::Distro.distro end
      	def su()      Os::Distro.su(self) end
      end
    end
  end
end