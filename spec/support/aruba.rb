RSpec.configure do |config|
  config.include ArubaDoubles

  config.before :each do
    ArubaDoubles::Double.setup
    prepend_environment_variable 'PATH', ArubaDoubles::Double.bindir + ':'
  end

  config.after :each do
    ArubaDoubles::Double.teardown
  end
end

Aruba.configure do |config|
  config.exit_timeout = 2
end