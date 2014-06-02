#!/bin/sh
exec /sbin/setuser app /usr/bin/mongod --config /etc/mongod.conf
