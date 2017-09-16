# -*- encoding: utf-8 -*-
# stub: tty-command 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tty-command"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Murach"]
  s.bindir = "exe"
  s.date = "2017-07-22"
  s.description = "Execute shell commands with pretty output logging and capture their stdout, stderr and exit status. Redirect stdin, stdout and stderr of each command to a file or a string."
  s.email = [""]
  s.homepage = "https://piotrmurach.github.io/tty"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Execute shell commands with pretty output logging and capture their stdout, stderr and exit status."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pastel>, ["~> 0.7.0"])
      s.add_development_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
    else
      s.add_dependency(%q<pastel>, ["~> 0.7.0"])
      s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<pastel>, ["~> 0.7.0"])
    s.add_dependency(%q<bundler>, ["< 2.0", ">= 1.5.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
  end
end
