module Picobox
  class Box
    include Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install(type = nil)
      return if type.nil?
      accept(Commands::AddBox.new(type))
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end

    def list()
      accept(Commands::ListBoxes.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end