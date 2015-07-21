FROM        dockerregistry.zetcom.local/vendor/ubuntu:14.04
MAINTAINER  bjoern.lippert@zetcom.local

VOLUME      /var/cache/apt-cacher-ng /var/log/apt-cacher-ng /etc/apt-cacher-ng
RUN     apt-get update && apt-get install -y apt-cacher-ng

EXPOSE      3142
#CMD     chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
CMD     chmod 777 /var/cache/apt-cacher-ng && chmod 777 /var/log/apt-cacher-ng \
        && /etc/init.d/apt-cacher-ng start \
        && tail -f /var/log/apt-cacher-ng/*
