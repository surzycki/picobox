module Picobox
  module Utils
    class Spinner
      class << self
        def new(message)
          pastel  = Pastel.new
          format  = "  #{message} [:spinner]"

          @spinner = TTY::Spinner.new(pastel.green(format),
            hide_cursor: true,
            clear: true
          )

          Picobox.verbose? ? puts(format) : spinner.auto_spin
        end


        def stop()
          spinner.stop
        end

        private
        attr_accessor :spinner
      end
    end
  end
end