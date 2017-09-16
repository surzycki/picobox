require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w[--color]
  t.pattern = "./spec/**/*_spec.rb"
end

task :default => :spec
