module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_service_start, type

        raise Errors::ProjectNotInitialized unless project_initialized?

        Services::Installer.new(os).install(type)

        publish_event :add_service_completed, type
      end

      private
      attr_reader :os, :type

      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end