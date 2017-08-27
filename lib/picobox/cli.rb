module Picobox
  class CLI < Thor
    include Thor::Actions

    desc 'version', 'displays current version'
    def version
      puts Picobox::VERSION
    end

    desc 'install', 'install picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def install
      say ''
      say 'INSTALL PICOBOX'
      say '-------------------------------'

      Installer.new(Os::Darwin.new).install
    end
  end
end