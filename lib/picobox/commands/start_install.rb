module Picobox
  module Commands
    class StartInstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :install_started
      end


      def visit_linux subject
        publish_event :install_started
      end
    end
  end
end