# picobox with ruby 2.4, nodejs
#
# VERSION               0.1.0
FROM ubuntu:16.04
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
RUN apt-get install -y software-properties-common git

# add repository
RUN apt-add-repository -y ppa:brightbox/ruby-ng

# ruby
RUN apt-get update -qq && apt-get install -y build-essential ruby2.4 ruby2.4-dev
RUN gem update --system

# utils
RUN apt-get install -y wget nano curl

# postgres client
RUN apt-get install -y libpq-dev postgresql-client

# sql-lite
RUN apt-get install -y libsqlite3-dev

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# phantomjs pre-requisites
RUN apt-get install -y chrpath libssl-dev libxft-dev
RUN apt-get install -y libfreetype6 libfreetype6-dev
RUN apt-get install -y libfontconfig1 libfontconfig1-dev

# phantomjs latest
RUN npm -g install phantomjs-prebuilt

# add bundler
RUN gem install bundler
RUN gem install rake

# working dir
WORKDIR $APP_HOME

# add gemfile
ADD Gemfile* $APP_HOME/

# make nano work
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# hook up cache volume
ENV BUNDLE_PATH /bundle

# hook up source
ADD . $APP_HOME

