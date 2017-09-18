module Picobox
  module Commands
    class AddBox < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        publish_event :add_box_start, type

        raise Errors::ProjectNotInitialized unless project_initialized?

        Boxes::Unpacker.new(os).unpack(type)
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      attr_reader :type

      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end