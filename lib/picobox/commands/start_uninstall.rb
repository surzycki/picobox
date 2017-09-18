module Picobox
  module Commands
    class StartUninstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PicoboxNotInstalled unless picobox_installed?

        publish_event :uninstall_started
      end

     
      def visit_linux subject
        visit_darwin subject
      end

      private
      def picobox_installed?
        File.exist? os.config_dir
      end
    end
  end
end