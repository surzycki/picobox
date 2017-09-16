# -*- encoding: utf-8 -*-
# stub: turnip 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "turnip"
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jonas Nicklas"]
  s.date = "2017-04-03"
  s.description = "Provides the ability to define steps and run Gherkin files from with RSpec"
  s.email = ["jonas.nicklas@gmail.com"]
  s.homepage = ""
  s.rubyforge_project = "turnip"
  s.rubygems_version = "2.5.1"
  s.summary = "Gherkin extension for RSpec"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, ["< 4.0", ">= 3.0"])
      s.add_runtime_dependency(%q<gherkin>, ["~> 4.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["< 4.0", ">= 3.0"])
      s.add_dependency(%q<gherkin>, ["~> 4.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["< 4.0", ">= 3.0"])
    s.add_dependency(%q<gherkin>, ["~> 4.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
