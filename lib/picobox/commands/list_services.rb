module Picobox
  module Commands
    class ListServices < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        services = Services::Manifest.new(os).list

        publish_event :list_services, services
      end

      private
      attr_reader :os
    end
  end
end