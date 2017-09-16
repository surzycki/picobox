# -*- encoding: utf-8 -*-
# stub: unindent 1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "unindent"
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["mynyml"]
  s.date = "2011-09-30"
  s.description = "Ruby method to unindent strings. Useful for multiline strings embeded in already indented code."
  s.email = "mynyml@gmail.com"
  s.homepage = "http://github.com/mynyml/unindent"
  s.rubyforge_project = "unindent"
  s.rubygems_version = "2.5.1"
  s.summary = "Ruby method to unindent strings."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<nanotest>, [">= 0"])
    else
      s.add_dependency(%q<nanotest>, [">= 0"])
    end
  else
    s.add_dependency(%q<nanotest>, [">= 0"])
  end
end
