# -*- encoding: utf-8 -*-
# stub: aruba-doubles 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "aruba-doubles"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bj\u{f6}rn Albers"]
  s.date = "2012-04-25"
  s.description = "Cucumber Steps to double Command Line Applications"
  s.email = ["bjoernalbers@googlemail.com"]
  s.homepage = "https://github.com/bjoernalbers/aruba-doubles"
  s.rubygems_version = "2.5.1"
  s.summary = "aruba-doubles-1.2.1"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2.2"])
      s.add_development_dependency(%q<aruba>, [">= 0.4.6"])
      s.add_development_dependency(%q<guard-cucumber>, [">= 0.7.3"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0.5.1"])
    else
      s.add_dependency(%q<cucumber>, [">= 1.0.2"])
      s.add_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_dependency(%q<rake>, [">= 0.9.2.2"])
      s.add_dependency(%q<aruba>, [">= 0.4.6"])
      s.add_dependency(%q<guard-cucumber>, [">= 0.7.3"])
      s.add_dependency(%q<guard-rspec>, [">= 0.5.1"])
    end
  else
    s.add_dependency(%q<cucumber>, [">= 1.0.2"])
    s.add_dependency(%q<rspec>, [">= 2.6.0"])
    s.add_dependency(%q<rake>, [">= 0.9.2.2"])
    s.add_dependency(%q<aruba>, [">= 0.4.6"])
    s.add_dependency(%q<guard-cucumber>, [">= 0.7.3"])
    s.add_dependency(%q<guard-rspec>, [">= 0.5.1"])
  end
end
