require 'aruba/in_process'
require 'aruba/turnip'
require 'runner'

RSpec.configure do |config|
  config.include Aruba::Api
end

if ENV['REMOTE_DEBUG'] == true
  require 'byebug/core'
  Byebug.wait_connection = true
  Byebug.start_server('localhost', 8989)
end

Aruba.configure do |config|
  config.exit_timeout = 2
  config.fixtures_directories = [ File.join("spec", "acceptance", "fixtures") ]
  config.command_launcher = :in_process
  config.main_class = Picobox::Runner
end





