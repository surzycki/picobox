module Picobox
  module Utils
    class VisitorByOs
      include Utils::DomainEventPublisher

      def visit subject
        method_name = "visit_#{subject.os.to_s}".intern
        send(method_name, subject )
      end

      def visit_darwin subject
        raise ::NotImplementedError, 'mac not supported'
      end

      def visit_linux subject
        raise ::NotImplementedError, 'linux not supported'
      end

      def visit_windows subject
        raise ::NotImplementedError, 'windows not supported'
      end

      def visit_unsupported subject
        os = TTY::Platform.new.os
        raise Errors::UnsupportedOsError, "#{os} is not yet supported :("
      end
    end
  end
end
