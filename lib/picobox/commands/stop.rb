module Picobox
  module Commands
    class Stop < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :stopping

        if project_initialized?
          system('docker-compose down 2>/dev/null') if project_running?
          publish_event :stopped
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