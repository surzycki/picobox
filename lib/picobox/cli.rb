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

      Installer.new(Picobox::Os::Darwin).install

      say ''
      say 'use "picobox init" to initialize picobox in your project root folder'
      say ''
      say '-------------------------------'
    end

    desc 'init', 'initialize director for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init
      Project.new(Picobox::Os::Darwin).init
    end
  end
end