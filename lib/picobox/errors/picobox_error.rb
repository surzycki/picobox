module Picobox
  module Errors
    class PicoboxError < StandardError; end
    class UnknownError < PicoboxError; end
    class BoxNotImplemented < PicoboxError; end
  end
end