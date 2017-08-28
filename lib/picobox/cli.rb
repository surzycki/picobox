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

    desc 'init [BOX] optional', 'initialize directory for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box_type = nil)
      Project.new(Picobox::Os::Darwin).init
      Box.new(Picobox::Os::Darwin).install box_type
    end

    desc 'dev', 'open dev box shell'
    long_desc <<-LONGDESC
    LONGDESC
    def dev()
      cmd.run :docker-compose, 'exec dev bash'
    end
  end
end