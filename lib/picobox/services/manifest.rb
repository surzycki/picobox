module Picobox
  module Services
    class Manifest
      def initialize(os, type = nil)
        @os, @type = os, type
      end

      def list
        result = Dir.glob("#{Picobox.service_packages_dir}/*").select {|f| File.directory? f}
        result.map {|r| strip_path(r) }.sort!
      end


      def package_contents
        @package_contents ||= Dir.glob(File.join(service, "*"))
      end


      def check!
        (raise Errors::ServiceNotImplemented, type) unless list.include?(type)
      end

      def docker_compose_file () "#{os.project_root}/docker-compose.yml" end
      def service_name()         (package.keys - ['links', 'instructions']).first end

      def service ()                  slice(package, service_name) end
      def service_links()             slice(package, 'links')['links'] end
      def post_install_instructions() slice(package, 'instructions')['instructions'] end

      private
      attr_reader :os, :type

      def package
        @package ||= YAML.load_file("#{package_dir}/config.yml")
      end

      def package_dir
        "#{Picobox.service_packages_dir}/#{type}"
      end

      def strip_path(file)
        file.split('/').last
      end

      def slice(hash, *keys)
        Hash[ [keys, hash.values_at(*keys)].transpose]
      end
    end
  end
end