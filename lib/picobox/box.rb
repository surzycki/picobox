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
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end

    def list()
      accept(Commands::ListBoxes.new)
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end
  end
end