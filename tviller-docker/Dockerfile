############################################################
# Dockerfile to build Tviller chat server Application Containers
# Based on Debian wheezy
############################################################
# Set the base image to Ubuntu
FROM tutum/debian:wheezy 

# File Author / Maintainer
MAINTAINER nut@abctech-thailand.com

# Add the application resources URL®
COPY ./manifest/sources.list /etc/apt/
RUN apt-get update

# Install basic applications
RUN apt-get install -y --force-yes make aptitude apt-utils tar curl wget vim build-essential inotify-tools openssh-server

# Install startsiden nodejs
RUN apt-get install -y --force-yes python g++ startsiden-nodejs meetv-chat-server

# Install Node public apps
RUN npm install pm2 -g --unsafe-perm

# Install Nginx
RUN wget http://www.dotdeb.org/dotdeb.gpg -O- |apt-key add - && apt-get update
RUN apt-get -y --force-yes install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY ./manifest/tviller-server.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/tviller-server.conf /etc/nginx/sites-enabled/tviller-server 


WORKDIR /var/www/tviller-server
COPY ./manifest/run.sh /var/www/tviller-server/
COPY ./manifest/local.json /var/www/tviller-server/configs/local.json

RUN chmod 755 ./run.sh

EXPOSE 8088

CMD ["/bin/bash", "./run.sh"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*