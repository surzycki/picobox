# picobox for use with rails containing ruby and nodejs
#
# VERSION               0.1.0
FROM picobox/ruby:latest
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV APP_HOME /var/www
ENV PATH $APP_HOME/bin:$PATH

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME picobox

# do install here
RUN mkdir -p /tmp
WORKDIR /tmp

## Database dependencies

# postgres client
RUN apt-get install -y libpq-dev postgresql-client

# sql-lite
RUN apt-get install -y libsqlite3-dev

# mysql
RUN apt-get install -y libmysqlclient-dev

## Tools

# phantomjs pre-requisites
RUN apt-get install -y chrpath libssl-dev libxft-dev
RUN apt-get install -y libfreetype6 libfreetype6-dev
RUN apt-get install -y libfontconfig1 libfontconfig1-dev

# phantomjs latest
RUN npm -g install phantomjs-prebuilt

# utils
RUN apt-get install -y nano

# hook up cache volume
ENV BUNDLE_PATH /bundle

# working dir
WORKDIR $APP_HOME

# add gemfile
ONBUILD ADD Gemfile* $APP_HOME/

# hook up source
ONBUILD ADD . $APP_HOME