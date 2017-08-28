module Picobox
  class UserShell
    attr_reader :startup_script

    def initialize(startup_script)
      @startup_script = startup_script
    end

    def install
      startup_script.install
    end
  end
end