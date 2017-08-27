module Picobox


  class Installer
    include Picobox::Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install
      accept(Picobox::Commands::DownloadDocker.new)
      accept(Picobox::Commands::InstallDocker.new)
      #accept(Picobox::Commands::SetupShell.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end