module Picobox
  module Utils
    module DomainEventPublisher
      include Wisper::Publisher

      def publish_event(event_name, *event_params)
        broadcast(event_name, *event_params)
      end
    end
  end
end