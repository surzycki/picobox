module Picobox
  class Service
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def build(service=nil)
      accept(Commands::BuildService.new(service))
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end

    def add(services)
      services.each { |service| accept(Commands::AddService.new(service)) }
      accept(Commands::Restart.new)
    rescue Errors::ServiceNotImplemented => e
      display_service_not_available e.message
      exit 1
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue Picobox::Errors::FileNotFoundError => e
      display_file_not_found e.message
      exit 1
    rescue StandardError => e
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
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end


    def list()
      accept(Commands::ListServices.new)
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end