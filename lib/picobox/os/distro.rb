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
          else
            message = <<-END.gsub(/^\s+\|/, '')
              |This installer needs the ability to run commands as root.
              |  We are unable to find 'sudo' available to make this happen.
              |
              |  Either:
              |    * Install sudo and add yourself to sudoers
              |    * Run as root
              |
            END
            raise StandardError, message
          end
        end
      end
    end
  end
end