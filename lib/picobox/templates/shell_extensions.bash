#!/bin/bash
#
# setup picobox proxies
#


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
    docker-compose exec "${@}"
  else
    if [ "$ZSH_NAME" ]; then
      `whence -p "${@[2]}"` "${@:3}"
    else
      `type -P "${@[2]}"` "${@:3}"
    fi
  fi
}

#picobox_cmd() {
#  case "${@[1]}" in
#    rails)
#      cmd=(dev bundle exec rails "${@:2}")
#      ;;
#    *)
#      echo "dunno"
#  esac
#
#  picobox_proxy ${cmd[@]}
#}

##
## ruby proxies
##
picobox_gem ()    { cmd=(dev gem $@) ; picobox_proxy ${cmd[@]} ; }
picobox_rake ()   { cmd=(dev rake $@) ; picobox_proxy ${cmd[@]} ; }
picobox_bundle () { cmd=(dev bundle $@) ; picobox_proxy ${cmd[@]} ; }
picobox_irb()     { cmd=(dev irb $@) ; picobox_proxy ${cmd[@]} ; }
picobox_ruby()    { cmd=(dev ruby $@) ; picobox_proxy ${cmd[@]} ; }

alias gem=picobox_gem
alias rake=picobox_rake
alias bundle=picobox_bundle
alias irb=picobox_irb
alias ruby=picobox_ruby


###
## rails proxies
##
picobox_rails ()   { cmd=(dev bundle exec rails $@) ; picobox_proxy ${cmd[@]} ; }
picobox_spring ()  { cmd=(dev bundle exec spring $@) ; picobox_proxy ${cmd[@]} ; }
picobox_yarn ()    { cmd=(dev bundle exec yarn $@) ; picobox_proxy ${cmd[@]} ; }
picobox_webpack () { cmd=(dev bundle exec webpack $@) ; picobox_proxy ${cmd[@]} ; }
picobox_guard ()   { cmd=(test bundle exec guard $@) ; picobox_proxy ${cmd[@]} ; }
picobox_rspec ()   { cmd=(test bundle exec rspec $@) ; picobox_proxy ${cmd[@]} ; }

picobox_webpack_dev_server() { cmd=(webpack bundle exec webpack-dev-server $@) ; picobox_proxy ${cmd[@]} ; }
picobox_webpack_watcher ()   { cmd=(webpack bundle exec webpack-watcher $@) ; picobox_proxy ${cmd[@]} ; }


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
picobox_redis_cli () { cmd=(redis redis-cli $@) ; picobox_proxy ${cmd[@]} ; }

alias redis-cli=picobox_redis_cli

##
## postgres proxies
##
picobox_psql () { cmd=(postgres psql $@) ; picobox_proxy ${cmd[@]} ; }

alias psql=picobox_psql

##
## mysql proxies
##
picobox_mysql () { cmd=(mysql mysql $@) ; picobox_proxy ${cmd[@]} ;}

alias mysql=picobox_mysql


##
## elixir proxies
##
picobox_elixir() { cmd=(dev elixir $@) ; picobox_proxy ${cmd[@]} ; }
picobox_mix()    { cmd=(dev mix $@) ; picobox_proxy ${cmd[@]} ; }
picobox_iex()    { cmd=(dev iex $@) ; picobox_proxy ${cmd[@]} ; }
picobox_erl()    { cmd=(dev erl $@) ; picobox_proxy ${cmd[@]} ; }

alias elixir=picobox_elixir
alias mix=picobox_mix
alias iex=picobox_iex
alias erl=picobox_erl


##
## python proxies
##
picobox_python() { cmd=(dev python $@) ; picobox_proxy ${cmd[@]} ; }
picobox_pip()    { cmd=(dev pip $@) ; picobox_proxy ${cmd[@]} ; }

alias python=picobox_python
alias pip=picobox_pip

