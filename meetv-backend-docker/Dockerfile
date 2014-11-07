############################################################
# Dockerfile to build MeeTV backend Env
# Based on Debian squeeze
# 1. App
# 2. Database
############################################################

# Set 1. the base image to debian:squeeze
FROM tutum/debian:squeeze


# File Author / Maintainer
MAINTAINER nut@abctech-thailand.com

# Add the application resources URL®
COPY ./manifest/sources.list /etc/apt/

# install essential packages
RUN apt-get update
RUN apt-get install -y --force-yes vim build-essential curl sshfs aspell aspell-da aspell-en aspell-fi aspell-no aspell-sv libreadline-dev libaspell-dev libgdbm-dev libgif-dev libjpeg62-dev libmagic-dev libpng12-dev libpq-dev librsvg2-dev libtiff4-dev libxapian-dev libxml2-dev libxslt1-dev zlib1g-dev xapian-tools git wget git

# create data dir
RUN mkdir -p /home/docker/docker_data/log /home/docker/docker_data/xapian /home/docker/docker_data/xapian/events /home/docker/docker_data/entities /home/docker/docker_data/channes /home/docker/docker_data/uepg

# set working dir
WORKDIR /home/repo

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Set 2. the base image to postgresql
#FROM postgres:9.3.5