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
    rescue Errors::ShellNotSupported => e
      display_shell_not_supported e.message
      exit 1
    rescue Errors::DistroNotSupported => e
      display_distro_not_supported
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def uninstall
      accept(Commands::StartUninstall.new)
      accept(Commands::RemoveSetupShell.new)
      accept(Commands::FinishUninstall.new)
    rescue Errors::PicoboxNotInstalled
      display_picobox_not_installed
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def start
      accept(Commands::Start.new)
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def stop
      accept(Commands::Stop.new)
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def restart
      accept(Commands::Restart.new)
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def ssh(service)
      accept(Commands::SshInstance.new(service))
    rescue Errors::SystemDownError
      display_system_down
      exit 1
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end