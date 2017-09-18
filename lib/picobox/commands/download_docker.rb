module Picobox
  module Commands
    class DownloadDocker < Picobox::Utils::VisitorByOs
      def visit_darwin subject 
        unless os.docker_installed?
          stream = open(os.docker_url,
            content_length_proc: lambda { |total| publish_event :download_docker_start, total },
            progress_proc: lambda { |step| publish_event :download_progress, step }
          )

          IO.copy_stream( stream, os.docker_installer )
          publish_event :download_docker_complete
        end
      end


      def visit_linux subject 
        unless os.docker_compose_installed?
          stream = open(os.docker_compose_url,
            content_length_proc: lambda { |total| publish_event :download_docker_compose_start, total },
            progress_proc: lambda { |step| publish_event :download_progress, step }
          )

          IO.copy_stream( stream, "#{os.tmp_dir}/docker_compose" )
          publish_event :download_docker_compose_complete

          system("sudo mv #{os.tmp_dir}/docker_compose #{os.docker_compose}")
          TTY::File.chmod(os.docker_compose, 'u=x')
        else
          publish_event :docker_present, os.docker_compose_version?
        end
      end  
    end
  end
end