module Picobox
  module Commands
    class InitializeProject < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        publish_event :project_initialize_start
        # for now just empty file, bue eventualy add flags 'ie enabled, etc'
        # https://github.com/albfan/bash-ini-parser
        TTY::File.create_file "#{os.current_dir}/#{os.picobox_dotfile}", 'h'

        publish_event :project_initialize_complete
      end

      private
      attr_reader :os
    end
  end
end