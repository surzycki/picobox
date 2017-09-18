module Picobox
  module Boxes
    class Manifest
      def initialize(os, type = nil)
        @os, @type = os, type
      end

      def list
        result = Dir.glob("#{Picobox.box_packages_dir}/*").select {|f| File.directory? f}
        result.map {|r| strip_path(r) }.sort!
      end


      def package_contents
        @package_contents ||= Dir.glob(File.join(package_dir, "*"))
      end


      def check!
        raise Errors::BoxNotImplemented unless list.include?(type)
      end


      def source
        @source ||= OpenStruct.new(
          start_script: "#{package_dir}/start",
          docker_compose: "#{package_dir}/docker-compose.yml",
          dockerfile: "#{package_dir}/Dockerfile"
        )
      end


      def dest
        @dest ||= OpenStruct.new(
          start_script: "#{os.project_root}/#{Picobox::CONFIG_DIR}/start",
          docker_compose: "#{os.project_root}/docker-compose.yml",
          dockerfile: "#{os.project_root}/Dockerfile"
        )
      end

      def additional_files
        (package_contents - source.to_h.values).map do |file|
          { source: file, dest: "#{os.project_root}/#{strip_path(file)}" }
        end
      end

      private
      attr_reader :os, :type

      def package_dir
        "#{Picobox.box_packages_dir}/#{type}"
      end

      def strip_path(file)
        file.split('/').last
      end
    end
  end
end