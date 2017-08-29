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
      say "use '\e[1m\e[33mpicobox init [BOX]\e[0m' to initialize picobox in your project root folder"
      say '-------------------------------'
    end


    desc 'init [BOX]', 'initialize directory for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box_type)
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


    desc 'open [instance]', 'open shell to instance'
    long_desc <<-LONGDESC
    LONGDESC
    def open(instance)
      say("\e[1m\e[32m[open]\e[0m Running \e[33m#{instance} shell\e[0m")
      system "bash", "-c", "docker-compose exec #{instance} bash"
    end


    desc 'boxes', 'list of available boxes'
    long_desc <<-LONGDESC
    LONGDESC
    def boxes()
      Box.new(Picobox::Os::Darwin).list
    end


    desc 'clean', 'clean stop containers'
    long_desc <<-LONGDESC
    LONGDESC
    def clean()
      say("\e[1m\e[32m[clean]\e[0m Cleaning stopped containers")
      system "docker container prune"
    end


  end
end