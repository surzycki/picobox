module Picobox
  module Commands
    class Restart < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        if project_running?
          System.new(Os::CurrentOs.get).stop
          System.new(Os::CurrentOs.get).start
        else
          System.new(Os::CurrentOs.get).start
        end
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      def project_running?() Utils::Project.new(os).running? end
    end
  end
end