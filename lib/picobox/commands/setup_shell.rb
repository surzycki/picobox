module Picobox
  module Commands
    class SetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :setup_shell_start

        template        = "#{Picobox.template_dir}/picobox_proxies.bash"
        picobox_proxies = "#{os.home_dir}/#{os.picobox_proxies}"
        TTY::File.copy_file template, picobox_proxies

        shell_startup_script = Shell::StartupScript.get(os)
        shell_startup_script.install_proxies

        publish_event :setup_shell_installed, shell_startup_script.path
      end

      private
      attr_reader :os
    end
  end
end