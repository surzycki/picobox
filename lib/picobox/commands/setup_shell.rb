module Picobox
  module Commands
    class SetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :shell_setup_start

        @start_up_script = Shell::StartupScript.get(os)

        create_config_directory
        install_shell_extensions

        publish_event :shell_setup_complete
      end

      private
      attr_reader :os, :start_up_script

      def create_config_directory
        TTY::File.create_dir os.config_dir
      end

      def install_shell_extensions
        start_up_script.install_extensions

        source  = "#{Picobox.template_dir}/shell_extensions.bash"
        dest    = os.shell_extensions

        TTY::File.copy_file source, dest
      end
    end
  end
end