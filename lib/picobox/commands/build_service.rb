module Picobox
  module Commands
    class BuildService < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        publish_event :build_service_start, service
        system "docker-compose build #{service} #{Picobox.output}"
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
