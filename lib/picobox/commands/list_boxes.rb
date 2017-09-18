module Picobox
  module Commands
    class ListBoxes < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        boxes = Boxes::Manifest.new(os).list

        publish_event :list_boxes, boxes
      end
      

      def visit_linux subject
        visit_darwin subject
      end
    end
  end
end