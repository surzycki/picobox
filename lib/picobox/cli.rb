module Picobox
  class ServiceSubCommands < Thor
    desc 'build [SERVICE] optional', 'builds the picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def build(service = nil)
      Service.new(Os::CurrentOs.get).build service
    end


    desc 'add [SERVICE]', 'adds a service to your box'
    long_desc <<-LONGDESC
    LONGDESC
    def add(*services)
      Service.new(Os::CurrentOs.get).add services
    end


    desc 'remove [SERVICE]', 'removes a service from your box'
    long_desc <<-LONGDESC
    LONGDESC
    def remove(service)
      Service.new(Os::CurrentOs.get).remove service
    end


    desc 'list', 'list available services'
    long_desc <<-LONGDESC
    LONGDESC
    def list()
      Service.new(Os::CurrentOs.get).list
    end
  end

  class DnsSubCommands < Thor
    desc 'add', 'add entry to DNS'
    long_desc <<-LONGDESC
    LONGDESC
    method_option :port, default: 3000
    def add(entry)
      puts "I'm a thor task! #{options}"
    end
  end

  class CLI < Thor
    include Utils::Output

    desc 'dns SUBCOMMAND', 'do things with the DNS'
    long_desc <<-LONGDESC
    LONGDESC
    subcommand 'dns', Picobox::DnsSubCommands


    desc 'service SUBCOMMAND', 'do things with the SERVICES'
    long_desc <<-LONGDESC
    LONGDESC
    subcommand 'service', Picobox::ServiceSubCommands


    desc 'version', 'displays current version'
    def version
      say Picobox::VERSION
    end


    desc 'install', 'installs picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def install
      System.new(Os::CurrentOs.get).install
      Utils::Shell.new(Os::CurrentOs.get).reload
    end


    desc 'update', 'udpates picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def update
      System.new(Os::CurrentOs.get).install
      Utils::Shell.new(Os::CurrentOs.get).reload
    end


    desc 'uninstall', 'removes picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def uninstall
      System.new(Os::CurrentOs.get).uninstall
    end


    desc 'init [BOX]', 'initialize directory for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box)
      os = Os::CurrentOs.get

      Project.new(os).init
      Box.new(os).install box
      Service.new(os).build
      System.new(os).start
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


    desc 'ssh [SERVICE]', 'open shell to service'
    long_desc <<-LONGDESC
    LONGDESC
    def ssh(service)
      System.new(Os::CurrentOs.get).open_shell service
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