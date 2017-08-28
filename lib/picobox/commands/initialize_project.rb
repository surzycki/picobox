module Picobox
  module Commands
    class InitializeProject < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :project_initialize_start
        # for now just empty dir, but eventualy add flags with ini files 'ie enabled, etc'
        # https://github.com/albfan/bash-ini-parser
        TTY::File.create_dir os.picobox_dir, os.current_dir

        publish_event :project_initialize_complete
      end

      private
      attr_reader :os
    end
  end
end