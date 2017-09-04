module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_service_start, service

        raise Errors::ProjectNotInitialized unless project_initialized?

        Services::Installer.new(os).install(service)

        publish_event :add_service_completed, service
      end

      private
      attr_reader :os, :service

      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end