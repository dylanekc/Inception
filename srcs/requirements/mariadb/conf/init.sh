#!/bin/bash

# On démarre le service MariaDB en arrière-plan juste pour le configurer
service mariadb start
sleep 2

# On utilise tes variables du fichier .env pour créer la base et l'utilisateur
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

# On éteint le service en arrière-plan
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

# On relance MariaDB au premier plan pour que le conteneur reste allumé
exec mysqld_safe
