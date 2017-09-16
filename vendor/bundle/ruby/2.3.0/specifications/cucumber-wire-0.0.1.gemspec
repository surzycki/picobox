# -*- encoding: utf-8 -*-
# stub: cucumber-wire 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "cucumber-wire"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matt Wynne"]
  s.date = "2015-12-23"
  s.description = "Wire protocol for Cucumber"
  s.email = "cukes@googlegroups.com"
  s.homepage = "http://cucumber.io"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "cucumber-wire-0.0.1"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.3.5"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>, ["~> 3"])
      s.add_development_dependency(%q<aruba>, ["~> 0"])
    else
      s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
      s.add_dependency(%q<bundler>, [">= 1.3.5"])
      s.add_dependency(%q<rake>, [">= 0.9.2"])
      s.add_dependency(%q<rspec>, ["~> 3"])
      s.add_dependency(%q<aruba>, ["~> 0"])
    end
  else
    s.add_dependency(%q<cucumber>, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>, [">= 1.3.5"])
    s.add_dependency(%q<rake>, [">= 0.9.2"])
    s.add_dependency(%q<rspec>, ["~> 3"])
    s.add_dependency(%q<aruba>, ["~> 0"])
  end
end
