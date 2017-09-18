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
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end