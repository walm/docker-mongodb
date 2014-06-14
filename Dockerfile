FROM walm/base:0.1.1
MAINTAINER Andreas Wålm "andreas@walm.net"

RUN \
  echo "# Installing mongodb" ;\
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 ;\
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list ;\
  apt-get update -qq ;\
  apt-get install -q -y mongodb-org=2.6.1 mongodb-org-server=2.6.1 mongodb-org-shell=2.6.1 mongodb-org-mongos=2.6.1 mongodb-org-tools=2.6.1 ;\
  chown -R app:app /var/lib/mongodb ;\
  chown -R app:app /var/log/mongodb ;\
  sed -i 's/bind_ip/# bind_ip/g' /etc/mongod.conf ;\
  \
  echo "# Cleaning up" ;\
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /setup /build

ADD mongodb.sh /etc/service/mongodb/run

# VOLUME ["/var/lib/mongodb"]

EXPOSE 27017
EXPOSE 28017
