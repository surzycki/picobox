module Picobox
  TMP_DIR = 'tmp'

  class Installer
    def initialize(os)
      @os = os
    end

    def install
      os.install_docker
    rescue Exception => e
      Formatador.display_line('[red]Something not so good happened[/]')
      Formatador.display_line("[red]#{e}[/]")
    end

    private
    attr_reader :os
  end
end