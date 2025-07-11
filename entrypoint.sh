#!/bin/sh

env >> /etc/environment
echo "$CRON (cd /git && /usr/bin/gitpull.sh)" > /var/spool/cron/crontabs/root

exec "$@"