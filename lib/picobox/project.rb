module Picobox
  class Project
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def init
      accept(Commands::InitializeProject.new)
    rescue Errors::PicoboxNotInstalled
      display_picobox_not_installed
      exit 1
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end