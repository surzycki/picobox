module Picobox
  class System
    include Utils::Visitable
    include Utils::Output

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def start
      accept(Commands::Start.new)
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end


    def stop
      accept(Commands::Stop.new)
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end


    def restart
      accept(Commands::Restart.new)
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end


    def open_shell(service)
      accept(Commands::OpenShell.new(service))
    rescue Exception => e
      display_info(e, :red)
      exit 1
    end
  end
end