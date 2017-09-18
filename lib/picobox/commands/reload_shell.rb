module Picobox
  module Commands
    class ReloadShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :reload_shell
        Utils::Shell.new(Os::CurrentOs.get).reload
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end