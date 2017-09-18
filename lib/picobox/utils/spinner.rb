module Picobox
  module Utils
    class Spinner
      class << self
        def new(message)
          pastel  = Pastel.new
          message = pastel.green("  #{message} [:spinner]")

          @spinner = TTY::Spinner.new(message, 
            hide_cursor: true, 
            clear: true
          )

          Picobox.verbose? ? puts(message) : spinner.auto_spin 
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