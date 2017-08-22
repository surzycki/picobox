# Gem development
#
# VERSION               0.0.1
FROM ubuntu:16.04
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV APP_HOME /var/www
ENV PATH $APP_HOME/bin:$PATH

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME gem_development

# add repository software
RUN apt-get update
RUN apt-get install -y software-properties-common git

# add repository
RUN apt-add-repository -y ppa:brightbox/ruby-ng

# update
RUN apt-get update -qq && apt-get install -y build-essential ruby2.4 ruby2.4-dev

# gem dependencies
RUN apt-get install -y ruby-dev zlib1g-dev liblzma-dev

# utils
RUN apt-get install -y wget nano

## add bundler
RUN gem install bundler

## working dir
WORKDIR $APP_HOME

# add gemfile
ADD Gemfile* $APP_HOME/

# make nano work
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# hook up cache volume
ENV BUNDLE_PATH /bundle

## hook up source
ADD . $APP_HOME
