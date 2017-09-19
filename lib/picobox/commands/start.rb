module Picobox
  module Commands
    class Start < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        publish_event :starting

        raise Errors::ProjectNotInitialized unless project_initialized?

        system("docker-compose up -d #{Picobox.output}")
        publish_event :started
      end


      def visit_linux subject
        visit_darwin subject
      end

      private
      def project_initialized?() Utils::Project.new(os).project_initialized? end
    end
  end
end