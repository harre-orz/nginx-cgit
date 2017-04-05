#!/bin/sh -x

SOCK=$(sed -n -e 's/.*unix:\(.*\);/\1/p' /etc/nginx/nginx.conf)
rm -f $SOCK
/usr/bin/fcgiwrap -c 4 -s unix:$SOCK &
sleep 1
chown nginx:nginx $SOCK
/usr/sbin/nginx -g "daemon off;"
