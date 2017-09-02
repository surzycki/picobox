module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_service_start, type

        if project_initialized?
          Services::Installer.new(os).install(type)
          publish_event :add_service_completed, type
        else
          publish_event :project_not_initialized
        end

      rescue Errors::ServiceNotImplemented
        publish_event :service_not_available, type
      rescue Picobox::Errors::FileNotFoundError => e
        publish_event :file_not_found, e.message
      end

      private
      attr_reader :os, :type

      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end