module Picobox
  module Commands
    class AddService < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        @os = subject.os
        publish_event :add_service_start, type

        if os.is_project?
          #Boxes::Unpacker.new(os).unpack(type)
        else
          publish_event :box_not_initialized
        end

      rescue Errors::BoxNotImplemented
        publish_event :box_not_available, type
      end

      private
      attr_reader :os, :type
    end
  end
end