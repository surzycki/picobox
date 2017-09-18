module Picobox
  module Commands
    class ListBoxes < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        boxes = Boxes::Manifest.new(os).list

        publish_event :list_boxes, boxes
      end
    end
  end
end