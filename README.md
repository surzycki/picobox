# Picobox

Docker development environment for humans.  So thin (1×10−12 m) you can barley feel it.

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
$ picobox_dev version
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

