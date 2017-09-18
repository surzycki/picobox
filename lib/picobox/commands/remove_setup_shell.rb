module Picobox
  module Commands
    class RemoveSetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :remove_shell_setup_start

        delete_config_directory
        uninstall_shell_extensions

        publish_event :remove_shell_setup_complete
      end


      def visit_linux subject
        visit_darwin subject
      end
      

      private
      def delete_config_directory
        TTY::File.remove_file os.config_dir, force: true
      end

      def uninstall_shell_extensions
        script = Shell::StartupScript.get(os)
        script.uninstall_extensions
      end
    end
  end
end