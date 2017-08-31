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

      def setup_shell_start
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
        display_info("#{type.capitalize} boxes are not implemented...yet", :red)
      end

      def box_not_initialized
        display_info("Project has not been initialized, run 'picobox init'", :red)
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
    end
  end
end