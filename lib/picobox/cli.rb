module Picobox
  class CLI < Thor
    include Thor::Actions

    desc 'version', 'displays current version'
    def version
      puts Picobox::VERSION
    end

    desc 'configure', 'configure picobox'
    long_desc <<-LONGDESC
    LONGDESC
    def configure
      say ''
      say 'CONFIGURE PICOBOX'
      say '-------------------------------'
      shell = `id -u -n`
      say "hello #{shell}"
    end
  end
end