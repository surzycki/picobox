module Picobox
  module Commands
    class AddBox < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :create_box_start, type

        if os.is_project?
          Picobox::Boxes::Unpacker.new(os).unpack(type)
        else
          publish_event :create_box_not_initialized
        end

      rescue Picobox::Errors::BoxNotImplemented
        publish_event :create_box_not_available, type
      end

      private
      attr_reader :os, :type
    end
  end
end