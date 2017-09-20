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
          su ||= if TTY::Which.exist?('sudo') && os.user != 'root'
            'sudo -E sh -c'
          elsif os.user == 'root'
            message = <<-END.gsub(/^\s+\|/, '')
              |Not a great idea to install things as root user.
              |
              |  You need to:
              |    * Install sudo and add yourself to sudoers
              |
            END
            raise StandardError, message
          else
            message = <<-END.gsub(/^\s+\|/, '')
              |This installer needs the ability to run commands as root.
              |  We are unable to find 'sudo' available to make this happen.
              |
              |  You need to:
              |    * Install sudo and add yourself to sudoers
              |
            END
            raise StandardError, message
          end
        end
      end
    end
  end
end