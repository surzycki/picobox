module Picobox
  module Commands
    class BuildService < Picobox::Utils::VisitorByOs
      def initialize(service)
        @service = service
      end

      def visit_darwin subject
        system "docker-compose build #{service}"
      end

      private
      attr_reader :service
    end
  end
end