module Picobox
  module Commands
    class SetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :shell_setup_start

        start_up_script = Shell::StartupScript.get(os)

        TTY::File.create_dir os.config_dir

        start_up_script.install_extensions

        publish_event :shell_setup_complete
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end