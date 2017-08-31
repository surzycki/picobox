module Picobox
  class CLI < Thor
    desc 'version', 'displays current version'
    def version
      say Picobox::VERSION
    end


    desc 'install', 'install picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def install
      say ''
      say 'INSTALL PICOBOX'
      say '-------------------------------'
      Installer.new(Os::CurrentOs.get).install
      say '-------------------------------'
      say ''
      say 'You should reload open shells to pick up shell changes'
      say ''
      say_status 'opening', 'new shell'
      say ''

      # hack to load newly set aliases into shell
      system("exec #{os.user_shell} -l")
    end


    desc 'update', 'udpates picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def update
      say ''
      say 'UPDATE PICOBOX'
      say '-------------------------------'
      Installer.new(Os::CurrentOs.get).install
      say '-------------------------------'
      say ''
      say 'You should reload open shells to pick up shell changes'
      say ''
      say_status 'opening', 'new shell'
      say ''

      # hack to load newly set aliases into shell
      system("exec #{os.user_shell} -l")
    end


    desc 'init [BOX]', 'initialize directory for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box_type)
      Project.new(Os::CurrentOs.get).init
      Box.new(Os::CurrentOs.get).install box_type
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
      system 'docker-compose down'
    end


    desc 'open [INSTANCE]', 'open shell to instance'
    long_desc <<-LONGDESC
    LONGDESC
    def open(instance)
      say("\e[1m\e[32m[open]\e[0m Running \e[33m#{instance} shell\e[0m")
      system "bash", "-c", "docker-compose exec #{instance} bash"
    end


    desc 'add [SERVICE]', 'adds a service to your box'
    long_desc <<-LONGDESC
    LONGDESC
    def add(service)
      Service.new(Os::CurrentOs.get).add service
    end


    desc 'services', 'list available services'
    long_desc <<-LONGDESC
    LONGDESC
    def services()
      Service.new(Os::CurrentOs.get).list
    end


    desc 'boxes', 'list of available boxes'
    long_desc <<-LONGDESC
    LONGDESC
    def boxes()
      Box.new(Os::CurrentOs.get).list
    end


    desc 'status', 'current status of containers'
    long_desc <<-LONGDESC
    LONGDESC
    def status()
      system "docker container ps"
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