module Picobox
  module Os
    class Linux
      class << self
        def tmp_dir() '/tmp' end

        def docker_filename() '' end
        def docker_url() "" end
        def docker_fullpath() "#{tmp_dir}/#{docker_filename}" end

        def docker_installed?() end

        def docker_version?
          `docker --version`
        end

        def to_s() :linux end
      end
    end
  end
end