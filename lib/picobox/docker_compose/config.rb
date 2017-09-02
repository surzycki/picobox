module Picobox
  module DockerCompose
    class Config
      def initialize(filename)
        @config = YAML.load_file(filename)
        @filename = filename
      rescue SystemCallError
        raise Picobox::Errors::FileNotFoundError, "could not open #{filename}"
      end


      def add_service(service, links)
        service_name = service.keys.first

        services = config['services'].merge! service

        links.each do |link|
          existing_service = services[link]
          if existing_service
            existing_service['links'] = (existing_service['links'] || Array.new).push service_name
            existing_service['links'].uniq!
          end
        end
      end


      def remove_service
      end


      def save
        File.open(filename,'w') do |h|
          h.write config.to_yaml
        end
      end

      private
      attr_accessor :config, :filename, :package
    end
  end
end