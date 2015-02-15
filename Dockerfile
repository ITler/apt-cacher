#
# Build: docker build -t apt-cacher .
# Run: docker run -d -p 3142:3142 --name apt-cacher-instance apt-cacher
#
FROM        ubuntu-base:latest
MAINTAINER  itl@netterchef.de

VOLUME      /var/cache/apt-cacher-ng /var/log/apt-cacher-ng
RUN     apt-get update && apt-get install -y apt-cacher-ng

EXPOSE      3142
#CMD     chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
CMD     chmod 777 /var/cache/apt-cacher-ng && chmod 777 /var/log/apt-cacher-ng \
        && /etc/init.d/apt-cacher-ng start \
        && tail -f /var/log/apt-cacher-ng/*
