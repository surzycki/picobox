# -*- encoding: utf-8 -*-
# stub: ghost 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ghost"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bodaniel Jeanes"]
  s.date = "2014-07-06"
  s.description = "Allows you to create, list, and modify local hostnames on POSIX systems (e.g. Mac OS X and Linux) and Windows"
  s.email = "me@bjeanes.com"
  s.executables = ["ghost"]
  s.files = ["bin/ghost"]
  s.homepage = "http://github.com/bjeanes/ghost"
  s.licenses = ["MIT"]
  s.rubyforge_project = "ghost"
  s.rubygems_version = "2.5.1"
  s.summary = "Allows you to create, list, and modify local hostnames"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<unindent>, ["= 1.0"])
      s.add_development_dependency(%q<rspec>, ["= 2.9.0"])
      s.add_development_dependency(%q<rake>, ["= 0.9.2.2"])
    else
      s.add_dependency(%q<unindent>, ["= 1.0"])
      s.add_dependency(%q<rspec>, ["= 2.9.0"])
      s.add_dependency(%q<rake>, ["= 0.9.2.2"])
    end
  else
    s.add_dependency(%q<unindent>, ["= 1.0"])
    s.add_dependency(%q<rspec>, ["= 2.9.0"])
    s.add_dependency(%q<rake>, ["= 0.9.2.2"])
  end
end
