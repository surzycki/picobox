# -*- encoding: utf-8 -*-
# stub: aruba-turnip 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "aruba-turnip"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joe Yates"]
  s.bindir = "exe"
  s.date = "2016-12-16"
  s.description = "This gem contains adaptations of Aruba's step definitions suitable for use\nin projects tested with RSpec and Turnip.\n"
  s.email = ["joe.g.yates@gmail.com"]
  s.homepage = "https://github.com/joeyates/aruba-turnip"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Turnip step definitions for Aruba."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<aruba>, ["~> 0.14"])
      s.add_development_dependency(%q<bundler>, ["~> 1.13"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<turnip>, [">= 0"])
    else
      s.add_dependency(%q<aruba>, ["~> 0.14"])
      s.add_dependency(%q<bundler>, ["~> 1.13"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<turnip>, [">= 0"])
    end
  else
    s.add_dependency(%q<aruba>, ["~> 0.14"])
    s.add_dependency(%q<bundler>, ["~> 1.13"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<turnip>, [">= 0"])
  end
end
