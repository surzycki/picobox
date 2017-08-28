module Picobox
  module Commands
    class SetupShell < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :setup_shell_start

        template        = "#{Picobox.template_dir}/picobox_proxies.bash"
        picobox_proxies = "#{os.home_dir}/#{os.picobox_proxies}"
        TTY::File.copy_file template, picobox_proxies

        # install shell proxies
        Picobox::Shell::StartupScript.get(os).install_proxies
      end

      private
      attr_reader :os
    end
  end
end