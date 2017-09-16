# Aruba-Doubles

Cucumber Steps to double Command Line Applications

## Introduction

> Sometimes it is just plain hard to test the system under test (SUT)
> because it depends on other components that cannot be used in the test
> environment. This could be because they aren't available, they will not
> return the results needed for the test or because executing them would
> have undesirable side effects. In other cases, our test strategy
> requires us to have more control or visibility of the internal behavior
> of the SUT.
> 
> When we are writing a test in which we cannot (or chose not to) use a
> real depended-on component (DOC), we can replace it with a Test Double.
> The Test Double doesn't have to behave exactly like the real DOC; it
> merely has to provide the same API as the real one so that the SUT
> thinks it is the real one!
>
> &mdash; <cite>[Gerard Meszaros, *xUnit Test Patterns: Refactoring Test
> Code*, Copyright © 2007, Addison-Wesley, ISBN
> 978-0131495050.](http://xunitpatterns.com/Test%20Double.html)</cite>

Aruba-Doubles is a [Cucumber](http://cukes.info/) extention to
temporarily "replace" selected Command Line Applications by Test
Doubles.
This allows you to simply stub these applications, fake their output and
check if and how they have been called.

(Aruba-Doubles is not an official part of
[Aruba](https://github.com/cucumber/aruba) but a good companion in the
same domain, hence the name.)

## Usage

If you have a `Gemfile`, add `aruba-doubles`. Otherwise, install it like this:

    gem install aruba-doubles

Then, `require` the [step
definitions](https://github.com/bjoernalbers/aruba-doubles/blob/master/lib/aruba-doubles/cucumber.rb)
in a ruby files below `features/support` (e.g. `env.rb`):

```Ruby
require 'aruba-doubles/cucumber'
```

Usage examples can be found in the
[features](https://github.com/bjoernalbers/aruba-doubles/tree/master/features)
directory.

## How it works

Aruba-Doubles does the following:

1. Hijack the PATH variable by injecting a temporary doubles directory
   in front of it.
2. Create Test Doubles (which are executable Ruby scripts) inside the
   doubles directory.
3. Restore the old PATH and remove all Test Doubles  after each
   scenario.

This way your SUT will pick up the Test Double instead of the real
Command Line Application.

## Caveats

Aruba-Double won't work, if your command:

* calls other commands with absolute path, i.e. `/usr/local/kill_the_cat`
* defines its own PATH
* calls build-in commands from your shell like `echo` (but who want to stub that)

Also note that doubles will be created as scripts in temporary directories on your filesystem, which might slow down your tests.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.  Note: the existing tests may fail
* Commit, do not mess with Rakefile, gemspec or History.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2011-2012 Björn Albers. See LICENSE for details.
