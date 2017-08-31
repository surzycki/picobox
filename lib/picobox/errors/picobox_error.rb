module Picobox
  module Errors
    class PicoboxError < StandardError; end
    class UnknownError < PicoboxError; end
    class BoxNotImplemented < PicoboxError; end
    class ServiceNotImplemented < PicoboxError; end
    class UnsupportedOsError < PicoboxError; end
  end
end