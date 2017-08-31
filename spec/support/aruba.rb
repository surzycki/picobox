RSpec.configure do |config|
  config.include ArubaDoubles

  config.before :each do
    ArubaDoubles::Double.setup
    prepend_environment_variable 'PATH', ArubaDoubles::Double.bindir + ':'
  end

  config.after :each do
    ArubaDoubles::Double.teardown
    ENV['PICOBOX_OS'] = nil
  end


  config.before(:each, type: /feature/) do |example|
    case example.metadata
    when ->(n) { n[:unsupported_os] }
      ENV['PICOBOX_OS'] = 'unsupported'
    end
  end
end

Aruba.configure do |config|
  config.exit_timeout = 2
end