module Picobox
  module Utils
    module Output
      def display_line(line)
        thor.say line
      end


      def display_info(info, color=nil)
        thor.say "  #{info}", color
      end


      def display_status(status, line, log_status=true)
        thor.say_status status, line, log_status
      end

      private
      def thor
        @thor ||= Thor::Shell::Color.new
      end
    end
  end
end