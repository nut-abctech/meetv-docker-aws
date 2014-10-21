############################################################
# Dockerfile to build Tviller chat server Application Containers
# Based on Debian wheezy
############################################################
# ------ 0 ------
# Set the base image to Ubuntu
FROM tutum/debian:wheezy 

# ------ 1 ------
# File Author / Maintainer
MAINTAINER nut@abctech-thailand.com

# ------ 2 ------
# Add the application resources URL®
ADD ./source.list /etc/apt/sources.list
# ------ 3 ------
RUN apt-get update

# ------ 4 ------
# Install basic applications
RUN apt-get install -y --force-yes make aptitude apt-utils tar curl wget vim build-essential inotify-tools openssh-server

# ------ 5 ------
# Install Nginx
RUN wget http://www.dotdeb.org/dotdeb.gpg -O- |apt-key add - && apt-get update
# ------ 6 ------
RUN apt-get -y --force-yes install nginx

# ------ 10 ------
WORKDIR /var/www/tviller-server
COPY ./run.sh /var/www/tviller-server/

CMD ["/run.sh"]
# ------ 12 ------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*