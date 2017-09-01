module Picobox
  module Os
    # TODO move to spec dir
    class TestOs < Darwin
      class << self
        def docker_installed?() true end
        def docker_version?()   "Docker version test" end
      end
    end
  end
end
