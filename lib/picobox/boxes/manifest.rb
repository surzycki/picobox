module Picobox
  module Boxes
    class Manifest
      def initialize(os, type = nil)
        @os, @type = os, type
      end

      def list
        result = Dir.glob("#{Picobox.box_packages_dir}/*").select {|f| File.directory? f}
        result.map {|r| strip_path(r) }
      end


      def package_contents
        @package_contents ||= Dir.glob(File.join(package, "*"))
      end


      def check!
        raise Errors::BoxNotImplemented unless list.include?(type)
      end


      def source
        @source ||= OpenStruct.new(
          start_script: "#{package}/start",
          docker_compose: "#{package}/docker-compose.yml",
          dockerfile: "#{package}/Dockerfile"
        )
      end


      def dest
        # TODO put project root dir in ini file
        @dest ||= OpenStruct.new(
          start_script: "#{os.current_dir}/#{os.picobox_dir}/start",
          docker_compose: "#{os.current_dir}/docker-compose.yml",
          dockerfile: "#{os.current_dir}/Dockerfile"
        )
      end

      def additional_files
        (package_contents - source.to_h.values).map do |file|
          { source: file, dest: "#{os.current_dir}/#{strip_path(file)}" }
        end
      end

      private
      attr_reader :os, :type

      def package
        "#{Picobox.box_packages_dir}/#{type}"
      end

      def strip_path(file)
        file.split('/').last
      end
    end
  end
end