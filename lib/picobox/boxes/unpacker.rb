module Picobox
  module Boxes
    class Unpacker
      def initialize(os)
        @os = os
      end

      def unpack(type)
        @manifest = Manifest.new(os, type)
        @manifest.check! # raises an exception if we can't find the type in the manifest

        unpack_start_script
        unpack_docker_files
        unpack_additional_files
      end

      private
      attr_reader :os, :manifest

      def unpack_start_script
        # start script
        TTY::File.copy_file(
          manifest.source.start_script,
          manifest.dest.start_script
        )

        TTY::File.chmod(manifest.dest.start_script, 0777)
      end

      def unpack_docker_files
        # docker-compose.yml
        TTY::File.copy_file(
          manifest.source.docker_compose,
          manifest.dest.docker_compose
        )

        # Dockerfile
        TTY::File.copy_file(
          manifest.source.dockerfile,
          manifest.dest.dockerfile
        )
      end

      def unpack_additional_files
        # unpack remaining in project root director
        manifest.additional_files.each do |file|
          TTY::File.copy_file(
            file[:source],
            file[:dest]
          )
        end
      end
    end
  end
end