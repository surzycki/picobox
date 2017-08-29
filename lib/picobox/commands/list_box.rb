module Picobox
  module Commands
    class ListBox < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        @os = subject.os

        boxes = Picobox::Boxes::Manifest.new(os).contents

        publish_event :list_boxes, boxes
      end

      private
      attr_reader :os
    end
  end
end