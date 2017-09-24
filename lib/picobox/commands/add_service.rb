module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        publish_event :add_service_start, service

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        Services::Installer.new(os).install(service)

        publish_event :add_service_completed, service
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      attr_reader :service
    end
  end
end