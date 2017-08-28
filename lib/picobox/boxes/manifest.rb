module Picobox
  module Boxes
    class Manifest
      def contents
        result = Dir.glob("#{Picobox.template_dir}/boxes/*").select {|f| File.directory? f}
        result.map {|r| r.split('/').last}
      end

      def contains?(entry)
        contents.include? entry
      end

      def check!(entry)
        raise Picobox::Errors::BoxNotImplemented unless contains?(entry)
      end
    end
  end
end