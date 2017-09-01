module Picobox
  module Commands
    class AddBox < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_box_start, type

        if project_initialzed?
          Boxes::Unpacker.new(os).unpack(type)
        else
          publish_event :project_not_initialized
        end

      rescue Errors::BoxNotImplemented
        publish_event :box_not_available, type
        Box.new(os).list
      end

      private
      attr_reader :os, :type

      def project_initialzed?() Utils::Project.new(os).project_initialzed? end
    end
  end
end