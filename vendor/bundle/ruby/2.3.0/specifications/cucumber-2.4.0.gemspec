# -*- encoding: utf-8 -*-
# stub: cucumber 2.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cucumber"
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aslak Helles\u{f8}y", "Matt Wynne", "Steve Tooke"]
  s.date = "2016-06-09"
  s.description = "Behaviour Driven Development with elegance and joy"
  s.email = "cukes@googlegroups.com"
  s.executables = ["cucumber"]
  s.files = ["bin/cucumber"]
  s.homepage = "http://cukes.info"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.5.1"
  s.summary = "cucumber-2.4.0"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber-core>, ["~> 1.5.0"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<gherkin>, ["~> 4.0"])
      s.add_runtime_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_runtime_dependency(%q<multi_test>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<cucumber-wire>, ["~> 0.0.1"])
      s.add_development_dependency(%q<aruba>, ["~> 0.6.1"])
      s.add_development_dependency(%q<json>, ["~> 1.7"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>, [">= 3.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0.6.2"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.7"])
      s.add_development_dependency(%q<syntax>, [">= 1.0.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<bcat>, ["~> 0.6.2"])
      s.add_development_dependency(%q<kramdown>, ["~> 0.14"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.0"])
      s.add_development_dependency(%q<capybara>, [">= 2.1"])
      s.add_development_dependency(%q<rack-test>, [">= 0.6.1"])
      s.add_development_dependency(%q<sinatra>, [">= 1.3.2"])
    else
      s.add_dependency(%q<cucumber-core>, ["~> 1.5.0"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.3"])
      s.add_dependency(%q<gherkin>, ["~> 4.0"])
      s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_dependency(%q<multi_test>, [">= 0.1.2"])
      s.add_dependency(%q<cucumber-wire>, ["~> 0.0.1"])
      s.add_dependency(%q<aruba>, ["~> 0.6.1"])
      s.add_dependency(%q<json>, ["~> 1.7"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0.9.2"])
      s.add_dependency(%q<rspec>, [">= 3.0"])
      s.add_dependency(%q<simplecov>, [">= 0.6.2"])
      s.add_dependency(%q<coveralls>, ["~> 0.7"])
      s.add_dependency(%q<syntax>, [">= 1.0.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<bcat>, ["~> 0.6.2"])
      s.add_dependency(%q<kramdown>, ["~> 0.14"])
      s.add_dependency(%q<yard>, ["~> 0.8.0"])
      s.add_dependency(%q<capybara>, [">= 2.1"])
      s.add_dependency(%q<rack-test>, [">= 0.6.1"])
      s.add_dependency(%q<sinatra>, [">= 1.3.2"])
    end
  else
    s.add_dependency(%q<cucumber-core>, ["~> 1.5.0"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.3"])
    s.add_dependency(%q<gherkin>, ["~> 4.0"])
    s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
    s.add_dependency(%q<multi_test>, [">= 0.1.2"])
    s.add_dependency(%q<cucumber-wire>, ["~> 0.0.1"])
    s.add_dependency(%q<aruba>, ["~> 0.6.1"])
    s.add_dependency(%q<json>, ["~> 1.7"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0.9.2"])
    s.add_dependency(%q<rspec>, [">= 3.0"])
    s.add_dependency(%q<simplecov>, [">= 0.6.2"])
    s.add_dependency(%q<coveralls>, ["~> 0.7"])
    s.add_dependency(%q<syntax>, [">= 1.0.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<bcat>, ["~> 0.6.2"])
    s.add_dependency(%q<kramdown>, ["~> 0.14"])
    s.add_dependency(%q<yard>, ["~> 0.8.0"])
    s.add_dependency(%q<capybara>, [">= 2.1"])
    s.add_dependency(%q<rack-test>, [">= 0.6.1"])
    s.add_dependency(%q<sinatra>, [">= 1.3.2"])
  end
end
