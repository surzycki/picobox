module Picobox
  class Installer
    include Utils::Visitable
    include Utils::Output

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
      display_info(e, :red)
      exit 1
    end
  end
end