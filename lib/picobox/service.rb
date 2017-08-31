module Picobox
  class Service
    include Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def add(type = nil)
      return if type.nil?
      #accept(Picobox::Commands::AddService.new(type))
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end

    def list()
      accept(Commands::ListServices.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end