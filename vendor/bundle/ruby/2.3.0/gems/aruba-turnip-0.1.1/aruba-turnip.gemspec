# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aruba/turnip/version"

Gem::Specification.new do |spec|
  spec.name          = "aruba-turnip"
  spec.version       = Aruba::Turnip::VERSION
  spec.authors       = ["Joe Yates"]
  spec.email         = ["joe.g.yates@gmail.com"]

  spec.summary       = %q{Turnip step definitions for Aruba.}
  spec.description   = <<-EOT
This gem contains adaptations of Aruba's step definitions suitable for use
in projects tested with RSpec and Turnip.
  EOT
  spec.homepage      = "https://github.com/joeyates/aruba-turnip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "aruba", "~> 0.14"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "turnip"
end
