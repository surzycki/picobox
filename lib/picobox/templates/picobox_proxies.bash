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
can_execute () {
  if [ -e "$PWD/.picobox" ]; then
    true
  else
    false
  fi
}

picobox_proxy () {
  if can_execute; then
    docker-compose exec $1 $2 "${@:3}"
  else
    `which $2` "${@:3}"
  fi
}

##
## ruby proxies
##
picobox_gem ()    { picobox_proxy $DEV "gem" "$@" ; }
picobox_rake ()   { picobox_proxy $DEV "rake" "$@" ; }
picobox_bundle () { picobox_proxy $DEV "bundle" "$@" ; }

alias gem=picobox_gem
alias rake=picobox_rake
alias bundle=picobox_bundle

##
## rails proxies
##
picobox_rails ()  { picobox_proxy $DEV "bundle exec rails" "$@" ; }
picobox_spring () { picobox_proxy $DEV "bundle exec spring" "$@" ; }
picobox_yarn () { picobox_proxy $DEV "bundle exec yarn" "$@" ; }
picobox_webpacker () { picobox_proxy $DEV "bundle exec webpacker" "$@" ; }
picobox_guard () { picobox_proxy $TEST "bundle exec guard" "$@" ; }
picobox_rspec () { picobox_proxy $TEST "bundle exec rspec" "$@" ; }

alias rails=picobox_rails
alias rspec=picobox_rspec
alias spring=picobox_spring
alias yarn=picobox_yarn
alias webpacker=picobox_webpacker
alias guard=picobox_guard

##
## ansible proxies
##
picobox_ansible_playbook () { picobox_proxy $DEV "ansible-playbook" "$@" ; }

alias ansible-playbook=picobox_ansible_playbook
