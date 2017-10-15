module Picobox
  module Commands
    class Start < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :starting

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        system("docker-compose up -d #{Picobox.output}") or raise Errors::DockerError

        publish_event :started
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end