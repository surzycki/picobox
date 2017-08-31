module Picobox
  module Handlers
    class StdoutHandler
      def docker_present(version)
        Formatador.display_line("[green]#{version.strip} present[/]")
      end

      def download_docker_start(size)
        Formatador.display_line('[green]Downloading Docker[/]')
        Utils::ProgressBar.new(size)
      end

      def download_docker_progress(progress)
        Utils::ProgressBar.step(progress)
      end

      def download_docker_complete()
        Formatador.display_line('[green]Preparing to install Docker[/]')
      end

      def install_docker_start(size)
        Formatador.display_line('[green]Installing Docker[/]')
        Utils::ProgressBar.new(size)
      end

      def install_docker_progress
        Utils::ProgressBar.increment
      end

      def install_docker_complete()
        Formatador.display_line('[green]Installed Docker[/]')
      end

      def setup_shell_start
        Formatador.display_line('[green]Setting up Shell[/]')
      end

      def install_complete
        Formatador.display_line('[green]Install Complete[/]')
      end

      def project_initialize_start
        Formatador.display_line('[green]Initializing Project[/]')
      end

      def project_initialize_complete
        Formatador.display_line('[green]Project Initialized[/]')
      end

      def create_box_start(type)
        Formatador.display_line("[green]Creating #{type} box[/]")
      end

      def create_box_not_available(type)
        Formatador.display_line("[red]#{type.capitalize} boxes are not implemented...yet[/]")
      end

      def create_box_not_initialized
        Formatador.display_line("[red]Project has not been initialized, run 'picobox init'[/]")
      end

      def list_boxes(boxes)
        Formatador.display_line("[green]Available boxes:[/]")

        boxes.each do |box|
          Formatador.display_line("  #{box}")
        end
      end

      def list_services(services)
        Formatador.display_line("[green]Available services:[/]")

        services.each do |service|
          Formatador.display_line("  #{service}")
        end
      end
    end
  end
end