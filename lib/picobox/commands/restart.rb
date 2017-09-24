module Picobox
  module Commands
    class Restart < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::ProjectNotInitialized unless os.project_initialized?

        if os.project_running?
          System.new(Os::CurrentOs.get).stop
          System.new(Os::CurrentOs.get).start
        else
          System.new(Os::CurrentOs.get).start
        end
      end


      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end