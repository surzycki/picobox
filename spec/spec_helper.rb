require 'picobox'

Dir["#{GEMROOT}/spec/support/**/*.rb"].each  { |f| require f }
Dir["#{GEMROOT}/spec/shared/**/*.rb"].each   { |f| require f }

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
