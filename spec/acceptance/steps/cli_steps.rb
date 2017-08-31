module CliSteps
  step 'I debug' do
    byebug
  end
end

RSpec.configure do |config|
  config.include CliSteps
end