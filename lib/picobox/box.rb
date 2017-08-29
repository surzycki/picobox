module Picobox
  class Box
    include Picobox::Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install(type = nil)
      return if type.nil?
      accept(Picobox::Commands::AddBox.new(type))
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end

    def list()
      accept(Picobox::Commands::ListBox.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end