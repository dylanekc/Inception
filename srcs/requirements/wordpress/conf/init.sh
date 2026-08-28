#!/bin/bash

# On configure PHP pour qu'il écoute sur le port 9000 (pour communiquer avec NGINX)
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

# On vérifie si WordPress est déjà installé pour ne pas le refaire à chaque redémarrage
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "Installation de WordPress..."
    
    # Téléchargement des fichiers de WordPress
    wp core download --allow-root

    # Création du fichier de liaison avec la base de données MariaDB
    wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

    # Installation du site et création du compte Administrateur
    wp core install --url=${DOMAIN_NAME} --title="Mon super site Inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

    # Création du deuxième utilisateur classique exigé par le sujet
    wp user create ${WP_USER} user@student.42.fr --role=author --user_pass=${WP_PASSWORD} --allow-root
    
    echo "WordPress est installé avec succès !"
fi

# On lance PHP en premier plan pour garder le conteneur allumé
exec /usr/sbin/php-fpm7.4 -F
