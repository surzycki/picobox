module Picobox
  class Box
    include Picobox::Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def install(type = nil)
      return if type.nil?
      accept(Picobox::Commands::InstallBox.new(type))
    rescue Exception => e
      byebug
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end