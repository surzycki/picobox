module Picobox
  class Project
    include Picobox::Utils::Visitable

    attr_reader :os

    def initialize(os)
      @os = os
    end

    def init
      accept(Picobox::Commands::InitializeProject.new)
    rescue Exception => e
      Formatador.display_line("[red]#{e}[/]")
    end
  end
end