# Picobox

Docker development environment for humans.  So thin (1×10−12 m) you can barley feel it.

Don't want to learn a whole -bunch --of -commands_with_flags/just -to run_rails?

Start picobox and continue with the way you have always done things, just now isolated inside a container

Caution, there be dragons...

## Installation CLI

```bash
$ gem install picobox
```



## Usage
```bash
$ picobox install
$ picobox init [BOX]
$ picobox start
$ picobox stop
$ picobox version
$ picobox boxes
$ picobox build [BOX] optional
$ picobox clean
$ picobox open [INSTANCE]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To use without installing, use:

```bash
$ bin/picobox_dev version
```

To install locally:

```bash
$ rake build
$ gem install pkg/picobox-x.x.x.gem
```

## TODO
- [ ] Write some tests, I mean come on!
- [ ] Include aliases specific to the box when unpacking
- [ ] Put boxes on dockerhub
- [ ] Add component command (redis, postgres, memcached, mongodb, etc)
- [ ] Add more boxes
- [ ] Add destroy command
- [ ] Add Habitus API web server to add ssh keys to containers**
- [ ] Use traefik.io for dns

**http://blog.cloud66.com/using-ssh-private-keys-securely-in-docker-build/

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/surzycki/picobox/issues. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

ctrl-k
asciinema rec testdrive

picobox install
mkdir -p Code/rails
cd Code/rails
picobox init rails
picobox build
gem install rails
picobox start
the gems will be installed in the container
gem install rails
cd ..
gem list | grep rails
look ma no rails!
cd rails
rails new .
rails c
rails s
picobox stop
rails s
the container is down so no rails