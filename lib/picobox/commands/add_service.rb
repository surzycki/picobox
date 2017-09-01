module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_service_start, type

        if project_initialzed?
          Services::Installer.new(os).install(type)
        else
          publish_event :project_not_initialized
        end

      rescue Errors::ServiceNotImplemented
        publish_event :service_not_available, type
      end

      private
      attr_reader :os, :type

      def project_initialzed?() Utils::Project.new(os).project_initialzed? end
    end
  end
end