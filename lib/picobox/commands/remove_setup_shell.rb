module Picobox
  module Commands
    class RemoveSetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :remove_shell_setup_start

        TTY::File.remove_file os.config_dir, force: true
        Shell::StartupScript.get(os).uninstall_extensions

        publish_event :remove_shell_setup_complete
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end