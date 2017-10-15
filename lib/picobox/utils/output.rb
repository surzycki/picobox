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


      def display_error(e)
        case e
        when Errors::ProjectNotInitialized
          display_project_not_initialized
        when Errors::DockerError
          display_docker_error
        when Errors::SystemDownError
          display_system_down
        when Errors::ShellNotSupported
          display_shell_not_supported e.message
        when Errors::DistroNotSupported
          display_distro_not_supported
        when Errors::PicoboxNotInstalled
          display_picobox_not_installed
        when Errors::ServiceNotImplemented
          display_service_not_available e.message
        when Picobox::Errors::FileNotFoundError
          display_file_not_found e.message
        else
          display_info(e, :red)
        end
      end

      private
      def display_project_not_initialized
        display_status('error', 'no project found', :red)
        display_info("Run 'picobox init [BOX]'", :yellow)
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

      def display_shell_not_supported(type)
        display_status('error', "shell not supported #{type}", :red)
        display_line ''

        display_line "You can file a request at: #{Picobox::HOMEPAGE}"
        display_line "and we'll get right on it!"
        display_line ''
      end

      def display_picobox_not_installed
        display_info "Picobox not installed!", :red
        display_info "Run: picobox install", :yellow
      end


      def display_distro_not_supported
        display_info('distro is not yet supported :(', :red)
      end

      def display_docker_error
        display_info "Docker gave an error", :red
        display_info "Check to see if docker is running", :red
        display_info("Try running 'docker ps'", :yellow)
      end

      private
      def thor
        @thor ||= Thor::Shell::Color.new
      end
    end
  end
end