module Picobox
  module Commands
    class SetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :shell_setup_start

        create_config_directory
        install_shell_extensions

        publish_event :shell_setup_complete
      end

      private
      attr_reader :os

      def create_config_directory
        TTY::File.create_dir os.config_dir
      end

      def install_shell_extensions
        source  = "#{Picobox.template_dir}/shell_extensions.bash"
        dest    = os.shell_extensions
        TTY::File.copy_file source, dest

        script = Shell::StartupScript.get(os)
        script.install_extensions
      end
    end
  end
end