source "https://rubygems.org"

gemspec

group :debug do
  if !RUBY_PLATFORM.include?("java")
    gem "byebug", "~> 4.0.5"
    gem "pry-byebug", "~> 3.1.0"
  end
end
