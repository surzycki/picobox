module Picobox
  module Commands
    class BuildService < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        publish_event :build_service_start, service
        # force verbose during building of boxes and services
        system "docker-compose build #{service} 2>&1"
        publish_event :build_service_stop
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      attr_reader :service
    end
  end
end
