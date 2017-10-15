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
    rescue StandardError => e
      display_error e
      exit 1
    end

    def list()
      accept(Commands::UpdatePackages.new)
      accept(Commands::ListBoxes.new)
    rescue StandardError => e
      display_error e
      exit 1
    end
  end
end