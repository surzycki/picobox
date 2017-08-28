module Picobox
  module Commands
    class FinishInstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        # clean up
        publish_event :install_complete
      end
    end
  end
end