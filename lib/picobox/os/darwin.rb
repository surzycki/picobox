module Picobox
  module Os
    class Darwin
      class << self
        def tmp_dir() '/tmp' end
        def home_dir() "#{ENV['HOME']}" end
        def current_dir() `pwd`.strip end
        def picobox_dir() '.picobox' end

        def docker_filename() 'Docker.dmg' end
        def docker_url() "https://download.docker.com/mac/stable/#{docker_filename}" end
        def docker_installer() "#{tmp_dir}/#{docker_filename}" end
        def docker_installed?() File.exist?('/Applications/Docker.app') end
        def docker_version?() `docker --version` end

        def user_shell() "#{ENV['SHELL']}" end

        def picobox_proxies() '.picobox' end

        def is_project?
          File.exist? "#{current_dir}/#{picobox_dir}"
        end

        def to_s() :darwin end
      end
    end
  end
end
