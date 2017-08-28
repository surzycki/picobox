module Picobox
  module Boxes
    class Unpacker
      def initialize(os)
        @os = os
      end

      def unpack(type)
        # raises an exception if we can't find the type in the manifest
        Manifest.new.check!(type)
        unpack_start_script type
        unpack_docker_files type

        # TODO get more fancy here, but if we use external sources this doesn't matter
          #box_dir        = "#{Picobox.template_dir}/boxes"
          #start_template = "#{box_dir}/#{type}/start"

          #TTY::File.copy_file(start_template, "#{os.current_dir}/#{os.picobox_dir}")
          #TTY::File.chmod(start_dest, 0777)

          #docker_compose_template = "#{box_dir}/#{type}/docker-compose.yml"
          #dockerfile_template     = "#{box_dir}/#{type}/Dockerfile"
          ##TTY::File.copy_file(docker_compose_template, os.project_dir)
        #TTY::File.copy_file(dockerfile_template, os.project_dir)
      end

      private
      attr_reader :os

      def unpack_start_script(type)
        # TODO put project root dir in ini file
        source = "#{Picobox.template_dir}/boxes/#{type}/start"
        dest   = "#{os.current_dir}/#{os.picobox_dir}/start"

        TTY::File.copy_file(source, dest)
        TTY::File.chmod(dest, 0777)
      end

      def unpack_docker_files(type)
        # docker-compose.yml
        source = "#{Picobox.template_dir}/boxes/#{type}/docker-compose.yml"
        dest   = "#{os.current_dir}/docker-compose.yml"

        TTY::File.copy_file(source, dest)

        # Dockerfile
        source = "#{Picobox.template_dir}/boxes/#{type}/Dockerfile"
        dest   = "#{os.current_dir}/Dockerfile"

        TTY::File.copy_file(source, dest)
      end
    end
  end
end