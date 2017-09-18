module Picobox
  module Commands
    class Restart < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        if project_running?
          Picobox::CLI.new.stop
          Picobox::CLI.new.start
        else
          Picobox::CLI.new.start
        end
      end

      private
      def project_running?() Utils::Project.new(os).running? end
    end
  end
end