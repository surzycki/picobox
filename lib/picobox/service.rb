module Picobox
  class Service
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def add(type = nil)
      return if type.nil?
      accept(Commands::AddService.new(type))
      accept(Commands::Restart.new)
    rescue Errors::ServiceNotImplemented
      display_service_not_available type
      list # called like for exception handling
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue Picobox::Errors::FileNotFoundError => e
      display_file_not_found e.message
      exit
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end


    def remove(type = nil)
      return if type.nil?
      accept(Commands::RemoveService.new(type))
      accept(Commands::Restart.new)
    rescue Errors::ServiceNotInstalled
      display_service_not_installed type
    rescue Errors::ServiceNotImplemented
      display_service_not_available type
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue Picobox::Errors::FileNotFoundError => e
      display_file_not_found e.message
      exit
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end


    def list()
      accept(Commands::ListServices.new)
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end
  end
end