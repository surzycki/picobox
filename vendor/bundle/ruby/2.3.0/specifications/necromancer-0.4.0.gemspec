# -*- encoding: utf-8 -*-
# stub: necromancer 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "necromancer"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Murach"]
  s.date = "2017-02-18"
  s.description = "Conversion from one object type to another with a bit of black magic."
  s.email = [""]
  s.homepage = "https://github.com/piotrmurach/necromancer"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Conversion from one object type to another with a bit of black magic."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.5.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.5.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.5.0"])
  end
end
