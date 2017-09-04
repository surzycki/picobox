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
        return if line.nil? || line.strip == ""
        thor.say_status status, line, log_status
      end


      def display_project_not_initialized
        display_status('error', 'no project found', :red)
        display_info("Run command in a project directory or create new project with 'picobox init [BOX]'", :green)
      end


      def display_box_not_available(type)
        display_status('error', "#{type.capitalize} boxes are not available...yet", :red)
      end


      def display_service_not_available(type)
        display_status('error', "#{type} service is not available...yet", :red)
      end


      def display_file_not_found(message)
        display_status('error', message, :red)
      end


      def display_system_down
        display_info("Picobox is not running!", :red)
      end


      def display_service_not_installed(type)
        display_status('info', "#{type} not installed", :yellow)
      end

      private
      def thor
        @thor ||= Thor::Shell::Color.new
      end
    end
  end
end