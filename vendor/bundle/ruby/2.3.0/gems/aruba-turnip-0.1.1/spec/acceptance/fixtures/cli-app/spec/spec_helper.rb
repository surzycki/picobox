$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift File.expand_path("../../../../../lib", __dir__)

require "aruba/turnip"
require "cli/app"

RSpec.configure do |config|
  config.include Aruba::Api
end

::Dir.glob(::File.expand_path("support/**/*.rb", __dir__)).each do |f|
  require_relative f
end

::Dir.glob(::File.expand_path("acceptance/support/**/*.rb", __dir__)).each do |f|
  require_relative f
end
