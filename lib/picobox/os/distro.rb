module Picobox
  module Os
    class Distro 
      class << self
        def distro
          case `lsb_release -ids`.strip
          when /(Ubuntu)/
            :ubuntu
          when /(Debian)/	
            :debian
          when /(Fedora)/
            :fedora
          else
            :unknown
          end
        end

        def su(os)
          su ||= if os.user == 'root'
            'sh -c'
          elsif TTY::Which.exist?('sudo')
            'sudo -E sh -c'
          elsif TTY::Which.exist?('su')
            'su -c'
          else
            raise StandardError, "Error: this installer needs the ability to run commands as root.\n  We are unable to find either 'sudo' or 'su' available to make this happen."
          end
        end
      end
    end
  end
end