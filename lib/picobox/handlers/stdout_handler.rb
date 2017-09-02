module Picobox
  module Handlers
    class StdoutHandler
      include Utils::Output

      def docker_present(version)
        display_info("#{version.strip} present", :green)
      end

      def download_docker_start(size)
        display_info('Downloading Docker', :green)
        Utils::ProgressBar.new(size)
      end

      def download_docker_progress(progress)
        Utils::ProgressBar.step(progress)
      end

      def download_docker_complete()
        display_info('[green]Preparing to install Docker[/]')
      end

      def install_docker_start(size)
        display_info('Installing Docker', :green)
        Utils::ProgressBar.new(size)
      end

      def install_docker_progress
        Utils::ProgressBar.increment
      end

      def install_docker_complete()
        display_info('Installed Docker', :green)
      end

      def shell_setup_start
        display_info('Setting up Shell', :green)
      end

      def install_complete
        display_info('Install Complete', :green)
      end

      def project_initialize_start
        display_info('Initializing Project', :green)
      end

      def project_initialize_complete
        display_info('Project Initialized', :green)
      end

      def add_box_start(type)
        display_info("Adding #{type} box", :green)
      end

      def box_not_available(type)
        display_status('error', "#{type.capitalize} boxes are not available...yet", :red)
      end

      def project_not_initialized
        display_status('error', 'no project found', :red)
        display_info("Run command in a project directory or create new project with 'picobox init [BOX]'", :green)
      end

      def list_boxes(boxes)
        display_info("Available boxes:", :green)

        boxes.each do |box|
          display_info("  #{box}")
        end
      end

      def list_services(services)
        display_info("Available services:", :green)

        services.each do |service|
          display_info("  #{service}")
        end
      end

      def add_service_start(type)
        display_info("Adding #{type} service", :green)
      end

      def service_not_available(type)
        display_status('error', "#{type.capitalize} service is not available...yet", :red)
      end

      def add_service_completed(type)
        display_info("Service #{type} added", :green)
      end

      def file_not_found(message)
        display_status('error', message, :red)
      end
    end
  end
end