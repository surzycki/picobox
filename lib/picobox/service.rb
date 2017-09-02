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
      accept(Picobox::Commands::AddService.new(type))
      #accept(Picobox::Commands::Restart.new)
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