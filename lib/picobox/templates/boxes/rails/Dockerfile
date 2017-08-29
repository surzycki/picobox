# picobox with ansible
#
# VERSION               0.1.0
FROM ubuntu:16.04
MAINTAINER Stefan Surzycki <stefan.surzycki@gmail.com>

ENV APP_HOME /etc/ansible

# silence deb warnings
ENV DEBIAN_FRONTEND noninteractive
ENV HOSTNAME picobox

# do install here
RUN mkdir -p /tmp
WORKDIR /tmp

# add repository software
RUN apt-get update
RUN apt-get install -y software-properties-common git tzdata wget curl

## Languages

# python
RUN apt-get install -y python-pip python-yaml gcc python-dev libffi-dev libssl-dev sshpass openssh-client

## Tools

# install boto for EC2 communication
RUN pip install --upgrade pip
RUN pip install -U boto awscli

# install ansible
RUN pip install ansible

# utils
RUN apt-get install -y nano

# set working dir
WORKDIR $APP_HOME

# hook up source
ONBUILD ADD . $APP_HOME

