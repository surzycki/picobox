module Picobox
  class Installer
    include Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install
      accept(Commands::DownloadDocker.new)
      accept(Commands::InstallDocker.new)
      accept(Commands::SetupShell.new)
      accept(Commands::FinishInstall.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
      exit 1
    end
  end
end