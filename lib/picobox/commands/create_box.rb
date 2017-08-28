module Picobox
  module Commands
    class CreateBox < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os

        publish_event :create_box_start, type
      end

      private
      attr_reader :os, :type
    end
  end
end