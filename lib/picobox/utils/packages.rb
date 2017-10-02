module Picobox
  module Utils
    class Packages
      def url()     info['tarball_url'] end
      def current_version()   info['tag_name'] end
      def installed_version() Picobox::Shell::IniFile.get(os)['packages']['version'] end

      def initialize(os)
        @os = os
      end

      def update?
        current_version > installed_version
      end

      def download
        IO.copy_stream(
          open(url),
          "#{os.tmp_dir}/packages_#{current_version}.tar"
        )

        "#{os.tmp_dir}/packages_#{current_version}.tar"
      end

      private
      attr_reader :os

      def info
        @info ||= JSON.parse(
          open(Picobox::PACKAGES_INFO_URL).read
        )
      end
    end
  end
end