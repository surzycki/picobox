$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

Dir.glob(::File.expand_path('support/**/*.rb', __dir__)).each do |f|
  require_relative f
end

require "aruba/turnip"
