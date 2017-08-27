module Picobox
  TMP_DIR = '/tmp'

  class Installer
    def initialize(os)
      @os = os
    end

    def install
      Formatador.display_line('[green]Downloading Docker[/]')
      os.download_docker(
        start:    lambda { |total| Picobox::Utils::ProgressBar.new(total) },
        progress: lambda { |step|  Picobox::Utils::ProgressBar.step(step)  }
      )

      Formatador.display_line('[green]Installing Docker[/]')
      os.install_docker(
        start:    lambda { |total| Picobox::Utils::ProgressBar.new(total) },
        progress: lambda { Picobox::Utils::ProgressBar.increment }
      )

      Formatador.display_line('[green]Installed Docker[/]')
    rescue Exception => e
      Formatador.display_line('[red]Something not so good happened[/]')
      Formatador.display_line("[red]#{e}[/]")
    end


    private
    attr_reader :os
  end
end