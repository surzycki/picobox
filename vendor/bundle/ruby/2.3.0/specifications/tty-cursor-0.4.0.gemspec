# -*- encoding: utf-8 -*-
# stub: tty-cursor 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-cursor"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Murach"]
  s.date = "2017-01-08"
  s.description = "The purpose of this library is to help move the terminal cursor around and manipulate text by using intuitive method calls."
  s.email = [""]
  s.homepage = "http://piotrmurach.github.io/tty/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Terminal cursor positioning, visibility and text manipulation."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
  end
end
