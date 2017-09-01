module Picobox
  module Os
    class CurrentOs
      class << self
        def get
          os = TTY::Platform.new.os
          case os
          when 'darwin' then Darwin
          else UnsupportedOs end
        end
      end
    end
  end
end
