module Picobox
  module Boxes
    class Manifest
      def initialize(os, type = nil)
        @os, @type = os, type
      end

      def contents
        result = Dir.glob("#{Picobox.template_dir}/boxes/*").select {|f| File.directory? f}
        result.map {|r| strip_path(r) }
      end


      def box_contents
        @box_contents ||= Dir.glob(File.join(box_dir, "*"))
      end


      def check!
        raise Picobox::Errors::BoxNotImplemented unless contents.include?(type)
      end


      def source
        @source ||= OpenStruct.new(
          start_script: "#{box_dir}/start",
          docker_compose: "#{box_dir}/docker-compose.yml",
          dockerfile: "#{box_dir}/Dockerfile"
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
        (box_contents - source.to_h.values).map do |file|
          { source: file, dest: "#{os.current_dir}/#{strip_path(file)}" }
        end
      end

      private
      attr_reader :os, :type

      def box_dir
        "#{Picobox.template_dir}/boxes/#{type}"
      end

      def strip_path(file)
        file.split('/').last
      end
    end
  end
end