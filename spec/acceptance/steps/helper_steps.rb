module HelperSteps
  step 'I debug' do
    byebug
  end
end


RSpec.configure do |config|
  config.include HelperSteps
end