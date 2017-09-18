module Picobox
  module Commands
    class FinishInstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :add_post_install_message, 'You should reload open shells to pick up shell changes'
        publish_event :install_complete
        publish_event :post_install_messages
      end


      def visit_linux subject
        publish_event :add_post_install_message, 'You should reload open shells to pick up shell changes'
        publish_event :install_complete
        publish_event :post_install_messages
      end
    end
  end
end