module Picobox
  module Commands
    class GetRootPermission < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        
      end


      def visit_linux subject
        "#{os.su} 'echo 1 > /dev/null'"
      end
    end
  end
end