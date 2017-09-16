module Picobox
  module Commands
    class DownloadDocker < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        unless subject.os.docker_installed?
          stream = open(subject.os.docker_url,
            content_length_proc: lambda { |total| publish_event :download_docker_start, total },
            progress_proc: lambda { |step| publish_event :download_docker_progress, step }
          )

          IO.copy_stream( stream, subject.os.docker_installer )
          publish_event :download_docker_complete
        end
      end

      def visit_linux subject
        publish_event :download_docker_complete
      end
    end
  end
end