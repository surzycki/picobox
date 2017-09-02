module Picobox
  module Services
    class Installer
      include Utils::Output

      def initialize(os)
        @os = os
      end


      def install(type)
        @manifest = Manifest.new(os, type)
        @manifest.check! # raises an exception if we can't find the type in the manifest

        config = DockerCompose::Config.new manifest.docker_compose_file
        config.add_service manifest.service, manifest.service_links

        config.save
        display_status 'modify', manifest.docker_compose_file
        display_status 'info',   manifest.post_install_instructions, :yellow
      end


      def uninstall(type)
        @manifest = Manifest.new(os, type)
        @manifest.check! # raises an exception if we can't find the type in the manifest

        config = DockerCompose::Config.new manifest.docker_compose_file
        config.remove_service manifest.service

        config.save
        display_status 'modify', filename
      end

      private
      attr_reader :os, :manifest
    end
  end
end