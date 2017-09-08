#!/bin/bash
#
# setup picobox proxies
#

###
### settings
###
DEV="dev"
TEST="test"
##
## functions
##
project_root() {
  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e "$directory/.picobox" && echo "$directory/.picobox" && return
    directory="$directory/.."
  done
}

can_execute () {
  if [ -e "$(project_root)/project.ini" ]; then
    true
  else
    false
  fi
}

picobox_proxy () {
  if can_execute; then
    docker-compose exec $1 $2 "${@:3}"
  else
    if [ "$ZSH_NAME" ]; then
      `whence -p $2` "${@:3}"
    else
      `type -P $2` "${@:3}"
    fi
  fi
}

##
## ruby proxies
##
picobox_gem ()    { picobox_proxy $DEV "gem" "$@" ; }
picobox_rake ()   { picobox_proxy $DEV "rake" "$@" ; }
picobox_bundle () { picobox_proxy $DEV "bundle" "$@" ; }
picobox_irb()     { picobox_proxy $DEV "irb" "$@" ;}
picobox_ruby()    { picobox_proxy $DEV "ruby" "$@" ;}

alias gem=picobox_gem
alias rake=picobox_rake
alias bundle=picobox_bundle
alias irb=picobox_irb
alias ruby=picobox_ruby

##
## rails proxies
##
picobox_rails ()  { picobox_proxy $DEV "bundle exec rails" "$@" ; }
picobox_spring () { picobox_proxy $DEV "bundle exec spring" "$@" ; }
picobox_yarn () { picobox_proxy $DEV "bundle exec yarn" "$@" ; }
picobox_webpack () { picobox_proxy $DEV "bundle exec webpack" "$@" ; }
picobox_guard () { picobox_proxy $TEST "bundle exec guard" "$@" ; }
picobox_rspec () { picobox_proxy $TEST "bundle exec rspec" "$@" ; }
picobox_webpack_dev_server() { picobox_proxy $DEV "bundle exec webpack-dev-server" "$@" ; }
picobox_webpack_watcher () { picobox_proxy $DEV "bundle exec webpack-watcher" "$@" ; }

alias rails=picobox_rails
alias rspec=picobox_rspec
alias spring=picobox_spring
alias yarn=picobox_yarn
alias webpack=picobox_webpack
alias webpack-dev-server=picobox_webpack_dev_server
alias webpack-watcher=picobox_webpack_watcher
alias guard=picobox_guard

##
## redis proxies
##
picobox_redis_cli () { picobox_proxy "redis" "redis-cli" "$@" ; }

alias redis-cli=picobox_redis_cli

##
## postgres proxies
##
picobox_psql () { picobox_proxy "postgres" "psql" "$@" ; }

alias psql=picobox_psql

##
## mysql proxies
##
picobox_mysql () { picobox_proxy "mysql" "mysql" "$@" ; }

alias psql=picobox_mysql


##
## elixir proxies
##
picobox_elixir() { picobox_proxy $DEV "elixir" "$@" ; }
picobox_mix()    { picobox_proxy $DEV "mix" "$@" ; }
picobox_iex()    { picobox_proxy $DEV "iex" "$@" ; }
picobox_erl()    { picobox_proxy $DEV "erl" "$@" ; }

alias elixir=picobox_elixir
alias mix=picobox_mix
alias iex=picobox_iex
alias erl=picobox_erl


##
## python proxies
##
picobox_python() { picobox_proxy $DEV "python" "$@" ; }
picobox_pip()    { picobox_proxy $DEV "pip" "$@" ; }

alias python=picobox_python
alias pip=picobox_pip

