module Picobox
  module Commands
    class UpdatePackages < Picobox::Utils::VisitorByOs
      def visit_darwin subject
        raise Errors::PicoboxNotInstalled unless os.picobox_installed?

        packages = Utils::Packages.new(os)

        if packages.update?
          publish_event :update_packages_start

          filename = packages.download

          system("rm -rf #{os.packages_dir}")
          system("mkdir  #{os.packages_dir}")
          system("tar xvf #{filename} -C #{os.packages_dir} --strip-components=1 #{Picobox.output}")

          Shell::IniFile.get(os)[:packages] = { version: packages.current_version, last_update: Time.now.to_i }

          publish_event :update_packages_stop
        end
      end


      def visit_linux subject
        raise Errors::PicoboxNotInstalled unless os.picobox_installed?

        packages = Utils::Packages.new(os)

        if packages.update?
          publish_event :update_packages_start

          filename = packages.download

          system("sudo rm -rf #{os.packages_dir}")
          system("sudo mkdir  #{os.packages_dir}")
          system("sudo tar xvf #{filename} -C #{os.packages_dir} --strip-components=1 #{Picobox.output}")

          Shell::IniFile.get(os)[:packages] = { version: packages.current_version, last_update: Time.now.to_i }

          publish_event :update_packages_stop
        end
      end
    end
  end
end
