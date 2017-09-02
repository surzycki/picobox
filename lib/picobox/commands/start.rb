module Picobox
  module Commands
    class Start < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :starting

        if project_initialized?
          system('docker-compose up -d 2>/dev/null') unless project_running?
          publish_event :started
        else
          publish_event :project_not_initialized
        end
      end

      private
      attr_reader :os

      def project_initialized?() Utils::Project.new(os).project_initialized? end
      def project_running?()     Utils::Project.new(os).running? end
    end
  end
end