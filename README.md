# Picobox

Docker development environment for humans.  So thin (1×10−12 m) you can barley feel it.

Don't want to learn a whole -bunch --of -commands_with_flags/just -to run_rails || other_things?

Start picobox and continue with the way you have always done things, except now, isolated inside containers

*Early release, caution, there be dragons...*

## Installation CLI

```bash
$ gem install picobox
$ picobox install
```

That's it your done


## Uninstall Picobox
```bash
$ picobox uninstall
$ gem uninstall picobox
```

Now you are really done


## Usage

![demo](https://github.com/surzycki/picobox/blob/master/docs/testdrive.gif)
(may take a sec to load)

**Create box**

```bash
$ mkdir -p Code/rails
$ cd Code/rails
$ picobox init rails
$ picobox build
$ picobox start
```

Your box is up and running, use your container-ized rails as you would normally

**Create a rails project**
```bash
$ gem install rails --no-ri --no-rdoc
$ rails new .
$ rails c
$ rake -T
$ rails s
```

**Do more stuff**
```bash
$ gem install rails --no-ri --no-rdoc
$ irb
$ bundle install
$ ruby
```

Everything is running inside your box transparently !

## Dependencies

### Linux
* build-essential
* ruby
* ruby-dev

## Development

To run the tests you'll need ruby 2.3 since we are using the <<~EOS operator (un-indented multiline strings)

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To use without installing, use:

```bash
$ bin/picobox version
```

To run tests:

```bash
$ bundle exec guard -g rspec
$ bundle exec guard -g acceptance
$ bundle exec guard -g wip
```


To install locally:

```bash
$ rake build
$ gem install pkg/picobox-x.x.x.gem
```

## Helpful stuff

**debug during an aruba test run**
spec/support/aruba.rb
```ruby
require 'byebug/core'
Byebug.wait_connection = true
Byebug.start_server('localhost', 8989)
```
then connect using:
```bash
$ bundle exec byebug -R localhost:8989
```

**will show that last command aruba executed**
```ruby
(byebug) last_command_started
```



## TODO
- [ ] Documentation (both in code and wiki)
- [ ] Include aliases specific to the box when unpacking (maybe)
- [ ] Add more boxes
- [ ] Add destroy command
- [ ] Add Habitus API web server to add ssh keys to containers**
- [ ] Use traefik.io for dns
- [ ] Uninstall should stop and remove all instances that are running
- [ ] Block most commands if picobox not installed
- [ ] Some services should install thier own volumes
- [ ] Box update function
- [ ] Remove TTY::File, TTY::Prompt dependency (needs native extensions)

**http://blog.cloud66.com/using-ssh-private-keys-securely-in-docker-build/

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/surzycki/picobox/issues. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

