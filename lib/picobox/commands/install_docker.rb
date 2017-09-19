module Picobox
  module Commands
    class InstallDocker < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        unless os.docker_installed?
          commands = [
            "/usr/bin/hdiutil attach -noidme -nobrowse -quiet #{subject.os.docker_installer}",
            "cp -R /Volumes/Docker/Docker.app /Applications",
            "open -a Docker",
            "/usr/bin/hdiutil unmount -quiet /Volumes/Docker"
          ]

          publish_event :install_docker_start

          commands.each do |command|
            system(command)
          end

          publish_event :install_docker_complete
        else
          publish_event :docker_present, os.docker_version?
        end
      end


      def visit_linux subject
        unless os.docker_installed?
          publish_event :install_docker_start

          stream = open('https://get.docker.com')

          IO.copy_stream( stream, 'get-docker.sh' )

          commands = [
            "sh get-docker.sh #{Picobox.output}",
            "rm get-docker.sh",
            "#{os.su} 'usermod -aG docker #{os.user}'"
          ]

          commands.each do |command|
            system(command)
          end

          publish_event :add_post_install_message, "If you would like to use Docker as a non-root user\nyou will have to log out and back in for this to take effect!"

          publish_event :install_docker_complete

        else
          publish_event :docker_present, os.docker_version?
        end
      end
    end
  end
end

