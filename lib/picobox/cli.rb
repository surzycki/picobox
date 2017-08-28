module Picobox
  class CLI < Thor
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


    desc 'build [BOX] optional', 'builds the picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def build(instance = nil)
      system "docker-compose build #{instance}"
    end


    desc 'start', 'start picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def start()
      system 'docker-compose up -d'
    end


    desc 'stop', 'stop picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def stop()
      system 'docker-compose stop'
    end


    desc 'dev', 'open dev box shell'
    long_desc <<-LONGDESC
    LONGDESC
    def dev()
      say("\e[1m\e[32m[open]\e[0m Running \e[33mdev terminal\e[0m")
      system "bash", "-c", "docker-compose exec dev bash"
    end
  end
end