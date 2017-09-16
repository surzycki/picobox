# -*- encoding: utf-8 -*-
# stub: aruba 0.14.2 ruby lib

Gem::Specification.new do |s|
  s.name = "aruba"
  s.version = "0.14.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aslak Helles\u{f8}y", "David Chelimsky", "Mike Sassak", "Matt Wynne", "Jarl Friis", "Dennis G\u{fc}nnewig"]
  s.date = "2016-08-16"
  s.description = "Extension for popular TDD and BDD frameworks like \"Cucumber\", \"RSpec\" and \"Minitest\" to make testing commandline applications meaningful, easy and fun."
  s.email = "cukes@googlegroups.com"
  s.executables = ["aruba"]
  s.files = ["bin/aruba"]
  s.homepage = "http://github.com/cucumber/aruba"
  s.licenses = ["MIT"]
  s.post_install_message = "Use on ruby 1.8.7\n* Make sure you add something like that to your `Gemfile`. Otherwise you will\n  get cucumber > 2 and this will fail on ruby 1.8.7\n\n  gem 'cucumber', '~> 1.3.20'\n\nWith aruba >= 1.0 there will be breaking changes. Make sure to read https://github.com/cucumber/aruba/blob/master/History.md for 1.0.0\n"
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.5.1"
  s.summary = "aruba-0.14.2"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, [">= 1.3.19"])
      s.add_runtime_dependency(%q<childprocess>, ["~> 0.5.6"])
      s.add_runtime_dependency(%q<ffi>, ["~> 1.9.10"])
      s.add_runtime_dependency(%q<rspec-expectations>, [">= 2.99"])
      s.add_runtime_dependency(%q<contracts>, ["~> 0.9"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.19"])
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
    else
      s.add_dependency(%q<cucumber>, [">= 1.3.19"])
      s.add_dependency(%q<childprocess>, ["~> 0.5.6"])
      s.add_dependency(%q<ffi>, ["~> 1.9.10"])
      s.add_dependency(%q<rspec-expectations>, [">= 2.99"])
      s.add_dependency(%q<contracts>, ["~> 0.9"])
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<bundler>, ["~> 1.11"])
    end
  else
    s.add_dependency(%q<cucumber>, [">= 1.3.19"])
    s.add_dependency(%q<childprocess>, ["~> 0.5.6"])
    s.add_dependency(%q<ffi>, ["~> 1.9.10"])
    s.add_dependency(%q<rspec-expectations>, [">= 2.99"])
    s.add_dependency(%q<contracts>, ["~> 0.9"])
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<bundler>, ["~> 1.11"])
  end
end
