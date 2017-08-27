module Picobox
  module Utils
    class VisitorByOs
      include Picobox::Utils::DomainEventPublisher

      def visit subject
        method_name = "visit_#{subject.os.to_s}".intern
        send(method_name, subject )
      end
    end
  end
end
