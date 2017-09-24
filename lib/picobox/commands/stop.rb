module Picobox
  module Commands
    class Stop < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :stopping

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        system("docker-compose down #{Picobox.output}")

        publish_event :stopped
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end