require 'aruba/in_process'
require 'aruba/turnip'
require 'runner'

RSpec.configure do |config|
  config.include Aruba::Api
end

require 'byebug/core'
Byebug.wait_connection = true
Byebug.start_server('localhost', 8989)

Aruba.configure do |config|
  config.exit_timeout = 2
  config.fixtures_directories = [ File.join("spec", "acceptance", "fixture") ]
  config.command_launcher = :in_process
  config.main_class = Picobox::Runner
end





