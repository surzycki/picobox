module Picobox
  module Shell
    class IniFile
      class << self
        def get(os)
          self.new(os)
        end
      end

      def initialize(os)
        @os = os
      end

      def install
        TTY::File.create_file filename do |content|
          "[packages]\nversion=v0.0\nlast_update=#{Time.now.to_i}\n"
        end unless File.exist? filename
      end


      def [](key)
        ini_file[key]
      end


      def []=(section, value)
        ini_file[section.to_s] = value
        ini_file.save
      end

      private
      attr_reader :os

      def filename() "#{os.config_dir}/#{Picobox::PICOBOX_INI}" end
      def ini_file() @ini_file ||= ::IniFile.load(filename) end
    end
  end
end