#!/bin/bash

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT SUPER ON *.* TO '$MYSQL_USER';"
