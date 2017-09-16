# -*- encoding: utf-8 -*-
# stub: tty-color 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-color"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Murach"]
  s.date = "2017-02-06"
  s.description = "Terminal color capabilities detection"
  s.email = [""]
  s.homepage = "http://piotrmurach.github.io/tty"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Terminal color capabilities detection"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
