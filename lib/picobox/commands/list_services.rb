module Picobox
  module Commands
    class ListServices < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        services = Services::Manifest.new(os).list

        publish_event :list_services, services
      end
    end
  end
end