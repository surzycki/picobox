module CliSteps
  step 'I am on an unsupported OS' do
    ENV['PICOBOX_OS'] = 'unsupported'
  end

  step 'I debug' do
    byebug
  end
end

RSpec.configure do |config|
  config.include CliSteps
end