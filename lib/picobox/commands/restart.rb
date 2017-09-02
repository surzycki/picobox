module Picobox
  module Commands
    class Restart < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        if project_running?
          Picobox::CLI.new.stop
          Picobox::CLI.new.start
        else
          Picobox::CLI.new.start
        end
      end

      private
      attr_reader :os

      def project_running?() Utils::Project.new(os).running? end
    end
  end
end