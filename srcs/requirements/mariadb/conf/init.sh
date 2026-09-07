#!/bin/bash

set -e

echo "=== MariaDB initialization ==="

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB database..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

chown -R mysql:mysql /var/lib/mysql

echo "Starting MariaDB temporarily..."
service mariadb start

echo "Waiting for MariaDB..."
until mariadb-admin ping --silent; do
    sleep 1
done

echo "MariaDB is ready!"

mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

ALTER USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

echo "MariaDB users and database configured."

mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

echo "Starting MariaDB in foreground..."

exec mysqld_safe

