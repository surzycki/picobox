module Picobox
  module Os
    class UnsupportedOs < Abstract
      class << self
        def to_s() :unsupported end
      end
    end
  end
end
