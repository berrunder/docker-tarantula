#!/bin/bash

source /usr/local/rvm/scripts/rvm

export RAILS_ENV=production
cd /opt/tarantula/rails
cp /opt/tarantula/database.yml config/database.yml

# Give MySQL time to start
sleep 5

mysql --host=mysql -utarantula -ptarantula tarantula -e "describe cases" > /dev/null 2>&1
RET=$?
set -e

if [ $RET -eq 0 ]; then
	echo 'Database found'
	echo 'Precompiling Tarantula'
	rake assets:precompile
else
	echo 'Installing Tarantula'
	echo -e "$URL\n$EMAIL\n$SMTP_HOST\n$SMTP_PORT\n$SMTP_DOMAIN" | \
		rake tarantula:install
fi

# Restart Apache
echo 'Restarting Apache'
pkill httpd

echo 'Starting tarantula delayed_job'
exec rake tarantula:jobs:work
