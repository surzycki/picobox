module Picobox
  module DockerCompose
    class Config
      def initialize(filename)
        @config = YAML.load_file(filename)
      rescue SystemCallError
        raise Picobox::Errors::FileNotFoundError, "could not open #{filename}"
      end

      def add_service

      end

      def save
        File.open(filename,'w') do |h|
          h.write config.to_yaml
        end
      end

      private
      attr_accessor :config, :filename
    end
  end
end