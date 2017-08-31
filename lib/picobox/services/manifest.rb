module Picobox
  module Services
    class Manifest
      def initialize(os, type = nil)
        @os, @type = os, type
      end

      def list
        result = Dir.glob("#{Picobox.service_packages_dir}/*").select {|f| File.directory? f}
        result.map {|r| strip_path(r) }
      end


      def package_contents
        @package_contents ||= Dir.glob(File.join(service, "*"))
      end


      def check!
        raise Errors::ServiceNotImplemented unless list.include?(type)
      end


      def source
        @source ||= OpenStruct.new()
      end


      def dest
        # TODO put project root dir in ini file
        @dest ||= OpenStruct.new()
      end

      def additional_files
      end

      private
      attr_reader :os, :type

      def package
        "#{Picobox.service_packages_dir}/#{type}"
      end

      def strip_path(file)
        file.split('/').last
      end
    end
  end
end