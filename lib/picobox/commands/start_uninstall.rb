module Picobox
  module Commands
    class StartUninstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PicoboxNotInstalled unless os.picobox_installed?

        publish_event :uninstall_started
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end