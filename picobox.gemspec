# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picobox/version'

Gem::Specification.new do |spec|
  spec.name          = "picobox"
  spec.version       = Picobox::VERSION
  spec.authors       = ['Stefan Surzycki']
  spec.email         = ['stefan.surzycki@gmail.com']

  spec.summary       = %q{The even more totally invisible ideal platform for developers}
  spec.description   = <<-DESC
    The even more totally invisible ideal platform for developers
  DESC
  spec.homepage      = "https://github.com/surzycki/picobox"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = ['picobox']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rake',  '~> 12.0'
  spec.add_development_dependency 'aruba-turnip'
  spec.add_development_dependency 'turnip'
  spec.add_development_dependency 'aruba'

  spec.add_dependency 'thor'
  spec.add_dependency 'formatador'
  spec.add_dependency 'ruby-progressbar'
  spec.add_dependency 'spinning_cursor'

end
