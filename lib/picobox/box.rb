module Picobox
  class Box
    include Picobox::Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def create(type = nil)
      return if type.nil?
      accept(Picobox::Commands::CreateBox.new(type))
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end