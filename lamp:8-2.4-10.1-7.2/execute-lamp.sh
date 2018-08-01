#!/bin/bash
docker-entrypoint.sh mysqld&
/usr/sbin/apache2ctl -D FOREGROUND
