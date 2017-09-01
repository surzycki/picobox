module Picobox
  module Commands
    class InitializeProject < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :project_initialize_start

        create_project_config_dir
        create_project_ini

        publish_event :project_initialize_complete
      end

      private
      attr_reader :os

      def create_project_config_dir
        # for now just empty dir, but eventualy add flags with ini files 'ie enabled, etc'
        # https://github.com/albfan/bash-ini-parser
        TTY::File.create_dir project_config_dir
      end

      def create_project_ini
        TTY::File.create_file "#{project_config_dir}/#{Picobox::PROJECT_INI}" do |content|
          "[project]\nroot=#{os.current_dir}\n"
        end
      end

      def project_config_dir
        "#{os.current_dir}/#{Picobox::CONFIG_DIR}"
      end
    end
  end
end