#!/bin/bash
#
# setup picobox proxies
#

###
### settings
###
dev="dev"

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
    docker-compose exec $1 bin/$2 "${@:3}"
  else
    `which $2` "${@:3}"
  fi
}

##
## ruby proxies
##
picobox_rake ()   { picobox_proxy $dev "rake" "$@" ; }
picobox_bundle () { picobox_proxy $dev "bundle" "$@" ; }

alias rake=picobox_rake
alias bundle=picobox_bundle

##
## rails proxies
##
picobox_rails ()  { picobox_proxy $dev "rails" "$@" ; }
picobox_spring () { picobox_proxy $dev "spring" "$@" ; }
picobox_yarn () { picobox_proxy $dev "yarn" "$@" ; }
picobox_webpacker () { picobox_proxy $dev "webpacker" "$@" ; }
picobox_guard () { picobox_proxy $dev "guard" "$@" ; }

alias rails=picobox_rails
alias spring=picobox_spring
alias yarn=picobox_yarn
alias webpacker=picobox_webpacker
alias guard=picobox_guard

