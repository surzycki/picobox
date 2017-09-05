# picobox with elixir
#
# VERSION               0.1.0
FROM elixir:latest
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV HOSTNAME picobox
ENV APP_HOME /var/www

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME picobox

# do install here
RUN mkdir -p /tmp
WORKDIR /tmp

# add repository software
RUN apt-get update

# install nodejs
# nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# utils
RUN apt-get install -y nano

# make nano work
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# get inotify
RUN apt-get install -y inotify-tools

# update mix
RUN mix local.hex --force
RUN mix local.rebar --force

# phoenix
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# working dir
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# hook up source
ONBUILD ADD . $APP_HOME