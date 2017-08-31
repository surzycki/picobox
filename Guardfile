group :acceptance do
  guard :rspec, cmd: 'bundle exec rspec --tag "acceptance"' do
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
    end
  end
end


group :wip do
  guard :rspec, cmd: 'bundle exec rspec --tag "wip"' do
    #watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
    end
  end
end

group :rspec do
  guard :rspec, cmd: 'bundle exec rspec --tag ~"acceptance"' do
    require "guard/rspec/dsl"
    dsl = Guard::RSpec::Dsl.new(self)

    # Feel free to open issues for suggestions and improvements

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)


    watch(%r{^lib/(.+).rb$}) do |m|
      "spec/#{m[1]}_spec.rb"
    end

    watch(%r{^spec/(.+).rb$}) do |m|
      "spec/#{m[1]}.rb"
    end
  end
end

