# python
#
# VERSION               0.0.2
FROM ubuntu
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV APP_HOME ~

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME picobox

# add repository software
RUN apt-get update

# replace default interpreter to bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

## Languages

# install python
RUN apt-get install -y python-pip python-yaml gcc python-dev libffi-dev libssl-dev sshpass openssh-client git

## Tools

# utils
RUN apt-get install -y sudo nano wget

# set working dir
WORKDIR $APP_HOME

# hook up source files
ADD . $APP_HOME