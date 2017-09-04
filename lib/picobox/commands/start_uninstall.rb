module Picobox
  module Commands
    class StartUninstall < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        raise Errors::PicoboxNotInstalled unless picobox_installed?

        publish_event :uninstall_started
      end

      private
      attr_reader :os

      def picobox_installed?
        File.exist? os.config_dir
      end
    end
  end
end