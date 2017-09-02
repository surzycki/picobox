module Picobox
  module Commands
    class OpenShell < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        @os = subject.os

        publish_event :opening_shell, service

        raise Errors::ProjectNotInitialized unless project_initialized?
        raise Errors::SystemDownError unless project_running?

        system "bash", "-c", "docker-compose exec #{service} bash"
        #else
        #  publish_event :system_stopped
        #end
      end

      private
      attr_reader :service, :os

      def project_initialized?() Utils::Project.new(os).project_initialized? end
      def project_running?()     Utils::Project.new(os).running? end
    end
  end
end