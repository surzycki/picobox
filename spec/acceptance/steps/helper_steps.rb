module HelperSteps
  step 'I debug' do
    byebug
  end

  step 'I wait :x seconds' do |x|
    sleep x.to_i
  end
end


RSpec.configure do |config|
  config.include HelperSteps
end