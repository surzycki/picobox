module Picobox
  module Errors
    class PicoboxError < StandardError; end
    class UnknownError < PicoboxError; end
  end
end