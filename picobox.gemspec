# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picobox/constants'

Gem::Specification.new do |spec|
  spec.name          = "picobox"
  spec.version       = Picobox::VERSION
  spec.authors       = ['Stefan Surzycki']
  spec.email         = ['stefan.surzycki@gmail.com']

  spec.summary       = %q{Docker development environment for humans}
  spec.description   = <<-DESC
    Docker development environment for humans
  DESC
  spec.homepage      = Picobox::HOMEPAGE
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|docs)/})
  end
  spec.required_ruby_version = ">= 2.0.0"

  spec.bindir        = 'bin'
  spec.executables   = ['picobox']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec',        '~> 3.6'
  spec.add_development_dependency 'rake',         '~> 12.0'
  spec.add_development_dependency 'aruba-turnip', '0.1.1'
  spec.add_development_dependency 'turnip'
  spec.add_development_dependency 'aruba-doubles'
  spec.add_development_dependency 'aruba',        '0.14.2'
  spec.add_development_dependency 'rb-readline'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'climate_control'


  spec.add_dependency 'thor',             '0.20.0'
  spec.add_dependency 'ruby-progressbar', '1.8.1'
  spec.add_dependency 'wisper',           '2.0.0'
  spec.add_dependency 'tty-file',         '0.4.0'
  spec.add_dependency 'tty-command',      '0.6.0'
  spec.add_dependency 'tty-spinner',      '0.7.0'
  spec.add_dependency 'ghost'
  spec.add_dependency 'tty-platform'
  spec.add_dependency 'tty-which'
  spec.add_dependency 'inifile'
end
