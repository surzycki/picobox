module Picobox
  module Handlers
    class StdoutHandler
      include Utils::Output

      def install_started
        display_line ''
        display_line 'INSTALL PICOBOX'
        display_line '-------------------------------'
      end

      def install_complete
        display_info   'Install Complete', :green
        display_line   '-------------------------------'
      end

      def add_post_install_message(message)
        @post_install_messages = (@post_install_messages || Array.new).push message
      end

      def post_install_messages
        display_line   ''

        @post_install_messages.each do |message|
          display_line message
          display_line   ''
        end
      end

      def docker_present(version)
        display_info("#{version.capitalize} present", :green)
      end

      def download_docker_start(size)
        display_info('Downloading Docker', :green)
        Utils::ProgressBar.new(size)
      end

      def download_progress(progress)
        Utils::ProgressBar.step(progress)
      end

      def download_docker_complete()
        display_info('Preparing to install Docker', :green)
      end

      def download_docker_compose_start(size)
        display_info('Downloading Docker Compose', :green)
        Utils::ProgressBar.new(size)
      end

      def download_docker_compose_complete()
        display_info('Preparing to install Docker Compose', :green)
      end

      def install_docker_start()
        Utils::Spinner.new('Installing Docker')
      end

      def install_docker_complete()
        Utils::Spinner.stop
        display_info('Installed Docker', :green)
      end

      def shell_setup_start
        display_info('Setting up Shell', :green)
      end

      def reload_shell
        display_status 'opening', 'new shell'
        display_line   ''
      end

      def remove_shell_setup_start
        display_info('Removing shell extentions', :green)
      end

      def uninstall_started
        display_line ''
        display_line 'UNINSTALL PICOBOX'
        display_line '-------------------------------'
      end

      def uninstall_complete
        display_info('Uninstall Complete', :green)
        display_line '-------------------------------'
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

      def build_service_start(service)
        Utils::Spinner.new("Building Service #{service} (5-10min)")
      end

      def build_service_stop
        Utils::Spinner.stop
        display_info("Service built", :green)
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

      def add_service_completed(type)
        display_info("Service #{type} added", :green)
      end

      def remove_service_start(type)
        display_info("Removing #{type} service", :green)
      end

      def remove_service_completed(type)
        display_info("Service #{type} removed", :green)
      end

      def stopping
        Utils::Spinner.new('Picobox stopping')
      end

      def stopped
        Utils::Spinner.stop
        display_info("Picobox stopped!", :green)
      end

      def starting
        Utils::Spinner.new('Picobox starting')
      end

      def started
        Utils::Spinner.stop
        display_info("Picobox started!", :green)
      end

      def opening_shell(service)
        display_info("Getting shell", :green)
        display_status('open', "Running \e[33m#{service}\e[0m shell", :green)
      end

      def update_packages_start
        Utils::Spinner.new('Updating packages')
      end

      def update_packages_stop
        Utils::Spinner.stop
        display_info("Packages updated!", :green)
      end
    end
  end
end