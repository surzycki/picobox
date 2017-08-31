module Picobox
  module Os
    class CurrentOs
      class << self
        def get
          return UnsupportedOs if ENV['PICOBOX_OS'] == 'unsupported'
          return TestOs if ENV['PICOBOX_ENV'] == 'test'

          os = TTY::Platform.new.os
          case os
          when 'darwin' then Darwin
          else UnsupportedOs end
        end
      end
    end
  end
end
