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
      # TODO place to inject unpacker for different types
      # of unpacking (ie net), could first search locally
      # then on the net
      # accept(Commands::AddBox.new(type, FileUnpacker, NetUnpacker))
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
      accept(Commands::ListBoxes.new)
    rescue StandardError => e
      display_info(e, :red)
      exit 1
    end
  end
end