module Picobox
  class CLI < Thor
    include Utils::Output

    desc 'version', 'displays current version'
    def version
      say Picobox::VERSION
    end


    desc 'install', 'install picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def install
      display_line ''
      display_line 'INSTALL PICOBOX'
      display_line '-------------------------------'
      Installer.new(Os::CurrentOs.get).install
      display_line '-------------------------------'
      display_line ''
      display_line 'You should reload open shells to pick up shell changes'
      display_line ''
      display_status 'opening', 'new shell'
      display_line ''

      Utils::Shell.new(Os::CurrentOs.get).reload
    end


    desc 'update', 'udpates picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def update
      display_line ''
      display_line 'UPDATE PICOBOX'
      display_line '-------------------------------'
      Installer.new(Os::CurrentOs.get).install
      display_line '-------------------------------'
      display_line ''
      display_line 'You should reload open shells to pick up shell changes'
      display_line ''
      display_status 'opening', 'new shell'
      display_line ''

      Utils::Shell.new(Os::CurrentOs.get).reload
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
      System.new(Os::CurrentOs.get).start
    end


    desc 'stop', 'stop picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def stop()
      System.new(Os::CurrentOs.get).stop
    end


    desc 'restart', 'restart picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def restart()
      System.new(Os::CurrentOs.get).restart
    end


    desc 'open [SERVICE]', 'open shell to service'
    long_desc <<-LONGDESC
    LONGDESC
    def open(service)
      System.new(Os::CurrentOs.get).open_shell service
    end


    desc 'add [SERVICE]', 'adds a service to your box'
    long_desc <<-LONGDESC
    LONGDESC
    def add(service)
      Service.new(Os::CurrentOs.get).add service
    end


    desc 'remove [SERVICE]', 'removes a service from your box'
    long_desc <<-LONGDESC
    LONGDESC
    def remove(service)
      Service.new(Os::CurrentOs.get).remove service
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
      system "docker-compose ps"
    end


    desc 'clean', 'clean stop containers'
    long_desc <<-LONGDESC
    LONGDESC
    def clean()
      display_info('Cleaning stopped containers', :green)
      display_status('execute', 'container prune')
      system "docker container prune"
      system "docker volume prune"
    end
  end
end