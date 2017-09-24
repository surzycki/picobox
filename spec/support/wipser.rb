RSpec.configure do |config|
  config.after :each, type: :feature do
    # aruba doesn't seem to let go of the main instance,
    # there for we pile up post_install_messages as each test is
    # run; here we are hard resetting the messages after each
    # feature test

    stdout = Wisper::GlobalListeners.listeners.select do |l|
      l.instance_of?(Picobox::Handlers::StdoutHandler)
    end.first

    stdout.instance_variable_set :@post_install_messages, Array.new
  end
end