module Picobox
  module Os
    class Darwin
      class << self
        def tmp_dir() '/tmp' end

        def docker_filename() 'Docker.dmg' end
        def docker_url() "https://download.docker.com/mac/stable/#{docker_filename}" end
        def docker_fullpath() "#{tmp_dir}/#{docker_filename}" end

        def docker_installed?
          true
        end

        def docker_version?
          `docker --version`
        end

        def to_s() :darwin end
      end
    end
  end
end
