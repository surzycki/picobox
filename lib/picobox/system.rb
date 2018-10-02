module Picobox
  class System
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install
      accept(Commands::StartInstall.new)
      accept(Commands::GetRootPermission.new)
      accept(Commands::DownloadDocker.new)
      accept(Commands::InstallDocker.new)
      accept(Commands::InstallConfig.new)
      accept(Commands::UpdatePackages.new)
      accept(Commands::SetupShell.new)
      accept(Commands::FinishInstall.new)
      accept(Commands::ReloadShell.new)
    rescue StandardError => e
      display_error e
      exit 1
    end


    def uninstall
      accept(Commands::StartUninstall.new)
      accept(Commands::RemoveSetupShell.new)
      accept(Commands::FinishUninstall.new)
    rescue StandardError => e
      display_error e
      exit 1
    end


    def start
      accept(Commands::Start.new)
    rescue StandardError => e
      display_error e
      exit 1
    end


    def stop
      accept(Commands::Stop.new)
    rescue StandardError => e
      display_error e
      exit 1
    end


    def restart
      accept(Commands::Restart.new)
    rescue StandardError => e
      display_error e
      exit 1
    end


    def ssh(service)
      accept(Commands::SshInstance.new(service))
    rescue StandardError => e
      display_error e
      exit 1
    end
  end
end
