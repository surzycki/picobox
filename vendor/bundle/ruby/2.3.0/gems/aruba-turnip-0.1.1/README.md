# Aruba::Turnip

This gem provides step definitions suitable for use
in projects tested with [RSpec](https://github.com/rspec/rspec) and
[Turnip](https://github.com/jnicklas/turnip).

The steps are direct adaptations of the step definitions and support code
provided by [Aruba](https://github.com/cucumber/aruba) for
[Cucumber](https://github.com/cucumber/cucumber-ruby).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aruba-turnip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aruba-turnip

## Usage

See the step definitions in `lib/aruba/turnip`.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you
to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags,
and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/joeyates/aruba-turnip.
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
