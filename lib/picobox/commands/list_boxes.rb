module Picobox
  module Commands
    class ListBoxes < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        boxes = Boxes::Manifest.new(os).list

        publish_event :list_boxes, boxes
      end

      private
      attr_reader :os
    end
  end
end