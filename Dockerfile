# Install MongoDB
#
FROM ubuntu
MAINTAINER Henri Bouvier

# Install Ubuntu dependencies
RUN apt-get update -y 
RUN apt-get install -y vim git-core build-essential libssl-dev curl wget

# From http://docs.docker.io/en/latest/examples/mongodb/

# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Hack for initctl not being available in Ubuntu
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

# Install MongoDB
RUN apt-get update -y
RUN apt-get install -y mongodb-10gen

# Create the MongoDB data directory
RUN mkdir -p /var/mongodb/data /var/mongodb/journal /var/log/mongodb
RUN ln -s /var/mongodb/journal /var/mongodb/data/journal

# To persist/write the database files OUTSIDE of the docker containter
# we expose the data directory
VOLUME [ "/var/mongodb/journal", "/var/mongodb/data", "/var/log/mongodb" ]

EXPOSE 27017
EXPOSE 28017

CMD /usr/bin/mongod --dbpath=/var/mongodb/data
