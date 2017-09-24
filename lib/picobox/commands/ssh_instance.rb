module Picobox
  module Commands
    class SshInstance < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        publish_event :opening_shell, service

        raise Errors::ProjectNotInitialized unless os.project_initialized?
        raise Errors::SystemDownError unless os.project_running?

        system "bash", "-c", "docker-compose exec #{service} bash"
      end


      def visit_linux subject
        visit_darwin subject
      end


      private
      attr_reader :service
    end
  end
end