module Picobox
  class Box
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install(type = nil)
      return if type.nil?
      accept(Commands::AddBox.new(type))
    rescue Errors::BoxNotImplemented
      display_box_not_available type
      list # called like for exception handling
    rescue Errors::ProjectNotInitialized
      display_project_not_initialized
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end

    def list()
      accept(Commands::UpdatePackages.new)
      accept(Commands::ListBoxes.new)
    rescue Errors::PicoboxNotInstalled
      display_picobox_not_installed
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end