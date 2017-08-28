module Picobox
  module Handlers
    class StdoutHandler
      def docker_present(version)
        Formatador.display_line("[green]#{version.strip} present[/]")
      end

      def download_docker_start(size)
        Formatador.display_line('[green]Downloading Docker[/]')
        Picobox::Utils::ProgressBar.new(size)
      end

      def download_docker_progress(progress)
        Picobox::Utils::ProgressBar.step(progress)
      end

      def download_docker_complete()
        Formatador.display_line('[green]Preparing to install Docker[/]')
      end

      def install_docker_start(size)
        Formatador.display_line('[green]Installing Docker[/]')
        Picobox::Utils::ProgressBar.new(size)
      end

      def install_docker_progress
        Picobox::Utils::ProgressBar.increment
      end

      def install_docker_complete()
        Formatador.display_line('[green]Installed Docker[/]')
      end

      def setup_shell_start
        Formatador.display_line('[green]Setting up shell[/]')
      end
    end
  end
end