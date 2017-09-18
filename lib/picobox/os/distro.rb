module Picobox
  module Os
    class Distro 
      class << self
        def distro!
          case `lsb_release -ids`.strip
          when /(Ubuntu)/
            :ubuntu
          when /(Debian)/	
            :debian
          else
            raise Errors::DistroNotSupported
          end
        end
      end
    end
  end
end