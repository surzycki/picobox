module Picobox
  class ServiceSubCommands < Thor
    desc 'build [SERVICE] optional', 'builds the picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def build(service = nil)
      Picobox.set_verbosity options[:verbose]

      Service.new(Os::CurrentOs.get).build service
    end


    desc 'add [SERVICE]', 'adds a service to your box'
    long_desc <<-LONGDESC
    LONGDESC
    def add(*services)
      Picobox.set_verbosity options[:verbose]

      Service.new(Os::CurrentOs.get).add services
    end


    desc 'remove [SERVICE]', 'removes a service from your box'
    long_desc <<-LONGDESC
    LONGDESC
    def remove(service)
      Picobox.set_verbosity options[:verbose]
      
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
      puts "coming soon"
    end
  end

  class CLI < Thor
    include Utils::Output

    class_option :verbose, desc: 'Verbose debugging output', type: :boolean

    #desc 'dns SUBCOMMAND', 'do things with the DNS'
    #long_desc <<-LONGDESC
    #LONGDESC
    #subcommand 'dns', Picobox::DnsSubCommands


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
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).install
    end


    desc 'update', 'udpates picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def update
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).install
    end


    desc 'uninstall', 'removes picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def uninstall
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).uninstall
    end


    desc 'init [BOX]', 'initialize directory for use with picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def init(box)
      Picobox.set_verbosity options[:verbose]

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
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).start
    end


    desc 'stop', 'stop picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def stop()
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).stop
    end


    desc 'restart', 'restart picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def restart()
      Picobox.set_verbosity options[:verbose]

      System.new(Os::CurrentOs.get).restart
    end


    desc 'ssh [SERVICE]', 'open shell to service'
    long_desc <<-LONGDESC
    LONGDESC
    def ssh(service)
      System.new(Os::CurrentOs.get).ssh service
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


    desc 'reset', 'reset picobox containers'
    long_desc <<-LONGDESC
    LONGDESC
    def reset()
      display_info('Cleaning stopped containers', :green)
      display_status('execute', 'container prune')
      system "docker container prune"
      system "docker volume prune"
    end
  end
end