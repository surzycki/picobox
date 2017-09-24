module Picobox
  module Commands
    class InstallConfig < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :config_setup_start

        TTY::File.create_dir os.config_dir
        Shell::IniFile.get(os).install
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end