module Picobox
  module Commands
    class InstallDocker < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        unless subject.os.docker_installed?
          commands = [
            "/usr/bin/hdiutil attach -noidme -nobrowse -quiet #{subject.os.docker_fullpath}",
            "cp -R /Volumes/Docker/Docker.app /Applications",
            "open -a Docker",
            "/usr/bin/hdiutil unmount -quiet /Volumes/Docker"
          ]

          publish_event :install_docker_start, commands.length

          commands.each do |command|
            system(command)
            publish_event :install_docker_progress
          end

          publish_event :install_docker_complete
        else
          publish_event :docker_present, subject.os.docker_version?
        end
      end

      def visit_linux subject
        raise ::NotImplementedError, 'linux not supported'
      end

      def visit_windows subject
        raise ::NotImplementedError, 'windows not supported'
      end
    end
  end
end