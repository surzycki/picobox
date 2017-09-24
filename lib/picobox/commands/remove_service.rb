module Picobox
  module Commands
    class RemoveService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        publish_event :remove_service_start, type

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        Services::Installer.new(os).uninstall(type)

        publish_event :remove_service_completed, type
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      attr_reader :type
    end
  end
end