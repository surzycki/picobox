# picobox for use with rails containing ruby and nodejs
#
# VERSION               0.1.0

# Change this for different versions of ruby (see https://hub.docker.com/_/ruby/)
# FROM ruby:2.2-slim
# FROM ruby:2.3-slim

FROM ruby:slim-stretch
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV APP_HOME /var/www
ENV PATH $APP_HOME/bin:$PATH

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME picobox

# do install here
RUN mkdir -p /tmp
WORKDIR /tmp

# add repository software
RUN apt-get update
RUN apt-get install -y build-essential software-properties-common tzdata wget curl gnupg2

## Languages

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs


## Database dependencies

# postgres client
RUN apt-get install -y libpq-dev postgresql-client

# sql-lite
RUN apt-get install -y libsqlite3-dev

# mysql
RUN apt-get install -y default-libmysqlclient-dev


# Tools

## phantomjs pre-requisites
RUN apt-get install -y chrpath libssl-dev libxft-dev
RUN apt-get install -y libfreetype6 libfreetype6-dev
RUN apt-get install -y libfontconfig1 libfontconfig1-dev

# phantomjs latest
RUN npm -g install phantomjs-prebuilt

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# utils
RUN apt-get install -y nano git

# make nano work
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# hook up cache volume
ENV BUNDLE_PATH /bundle

# working dir
WORKDIR $APP_HOME

# add gemfile
ONBUILD ADD Gemfile* $APP_HOME/

# hook up source
ONBUILD ADD . $APP_HOME