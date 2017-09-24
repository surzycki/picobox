module Picobox
  module Utils
    class Packages
      def version() info['tag_name'] end
      def url()     info['tarball_url'] end

      def initialize(os)
        @os = os
      end

      def update?
        installed_version = Picobox::Shell::IniFile.get(os)['packages']['version']
        available_version = version

        available_version > installed_version
      end

      def download
        IO.copy_stream(
          open(url),
          "#{os.tmp_dir}/packages_#{version}.tar"
        )

        "#{os.tmp_dir}/packages_#{version}.tar"
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