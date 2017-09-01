ENV['PICOBOX_ENV'] ||= 'test'

require 'picobox'
require 'fileutils'

spec = File.expand_path('..', __FILE__)

Bundler.require(:default, :development)

Dir["#{spec}/support/**/*.rb"].each  { |f| require f }
Dir["#{spec}/shared/**/*.rb"].each   { |f| require f }

require 'byebug'
require 'turnip_helper'
require 'turnip/rspec'


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.expose_dsl_globally              = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
