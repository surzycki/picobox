module Picobox
  module Commands
    class ReloadShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        
        Utils::Shell.new(Os::CurrentOs.get).reload
      end


      def visit_linux subject
        publish_event :reload_shell
        Utils::Shell.new(Os::CurrentOs.get).reload
      end
    end
  end
end