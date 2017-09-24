module Picobox
  module Commands
    class AddBox < Picobox::Utils::VisitorByOs
      def initialize(type)
        @type = type
      end

      def visit_darwin subject
        publish_event :add_box_start, type

        raise Errors::ProjectNotInitialized unless os.project_initialized?

        Boxes::Installer.new(os).install(type)
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      attr_reader :type
    end
  end
end