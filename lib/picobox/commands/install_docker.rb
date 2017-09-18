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

          publish_event :install_docker_start, commands.length

          commands.each do |command|
            system(command)
            publish_event :install_docker_progress
          end

          publish_event :install_docker_complete
        else
          publish_event :docker_present, os.docker_version?
        end
      end


      def visit_linux subject
        unless os.docker_installed?        
          commands = [
            "curl -fsSL get.docker.com -o get-docker.sh",
            "sudo sh get-docker.sh > /dev/null",
            "rm get-docker.sh",
            "sudo usermod -aG docker #{os.user}"
          ]

          publish_event :install_docker_start, 0

          commands.each do |command|
            system(command)
          end

          publish_event :install_docker_complete
        else
          publish_event :docker_present, os.docker_version?
        end
      end 
    end
  end
end

