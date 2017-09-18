module Picobox
  module Commands
    class RemoveService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        publish_event :remove_service_start, type

        raise Errors::ProjectNotInitialized unless project_initialized?

        Services::Installer.new(os).uninstall(type)

        publish_event :remove_service_completed, type
      end

      private
      attr_reader :type

      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end