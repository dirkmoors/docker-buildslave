###########################################################
# Dockerfile to create and run a buildbot-slave
# Based on baseimage: Debian Wheezy
###########################################################

FROM debian:wheezy
MAINTAINER Dirk Moors

#Environment
ENV BUILDMASTER_HOST localhost
ENV BUILDMASTER_PORT 9989
ENV BUILDSLAVE_NAME slave-name
ENV BUILDSLAVE_PASS slave-pass

#Update and install packages
RUN apt-get update && apt-get -yq install git-core python-dev python-pip python-virtualenv

#Cleanup apt
RUN rm -rf /var/lib/apt/lists/*

#Prepare virtualenv
RUN virtualenv /tmp/vikingdbdocker/venv
RUN . /tmp/vikingdbdocker/venv/bin/activate

#Install buildslave
RUN easy_install buildbot-slave

#Create buildslave 
RUN buildslave create-slave slave $BUILDMASTER_HOST:$BUILDMASTER_PORT $BUILDSLAVE_NAME $BUILDSLAVE_PASS

