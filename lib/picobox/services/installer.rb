module Picobox
  module Services
    class Installer
      def initialize(os)
        @os = os
      end


      def install(type)
        @manifest = Manifest.new(os, type)
        @manifest.check! # raises an exception if we can't find the type in the manifest

        config = DockerCompose::Config.new docker_compose_file

        config.add_service type
      end


      def uninstall(type)
      end

      private
      attr_reader :os, :manifest

      def docker_compose_file
      end
    end
  end
end