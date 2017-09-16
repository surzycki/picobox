require "aruba/turnip"

ACCEPTANCE_FIXTURES_PATH = File.join("spec", "acceptance", "fixtures")

RSpec.configure do |config|
  config.include Aruba::Api
end

Aruba.configure do |config|
  config.fixtures_directories = [ACCEPTANCE_FIXTURES_PATH]
end
