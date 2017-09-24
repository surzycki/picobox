module Picobox
  module Commands
    class InitializeProject < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PicoboxNotInstalled unless os.picobox_installed?

        publish_event :project_initialize_start

        # create project config_dir
        TTY::File.create_dir project_config_dir

        # create project ini
        TTY::File.create_file "#{project_config_dir}/#{Picobox::PROJECT_INI}" do |content|
          "[project]\nenabled=true\n"
        end

        publish_event :project_initialize_complete
      end


      def visit_linux subject
        visit_darwin subject
      end


      private
      def project_config_dir
        "#{os.current_dir}/#{Picobox::CONFIG_DIR}"
      end
    end
  end
end