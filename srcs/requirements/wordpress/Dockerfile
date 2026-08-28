FROM debian:bullseye

# Installation de PHP et des outils nécessaires pour lire la base de données
RUN apt update -y && apt install -y php7.4-fpm php7.4-mysql curl mariadb-client

# Création du dossier d'accueil de ton site
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Installation de WP-CLI (un outil magique pour installer WordPress en ligne de commande)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Copie du script d'initialisation et configuration des droits
COPY conf/init.sh /init.sh
RUN chmod +x /init.sh

# Lancement du script au démarrage
ENTRYPOINT ["/init.sh"]
