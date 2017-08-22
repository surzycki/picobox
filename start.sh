#!/bin/bash
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install

sleep 5d
