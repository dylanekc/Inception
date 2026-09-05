FROM debian:bullseye

RUN printf 'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260824T000000Z bullseye-security main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye-updates main\n' \
> /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends \
        php7.4-fpm \
        php7.4-mysql \
        curl \
        ca-certificates \
        mariadb-client && \
    rm -rf /var/lib/apt/lists/*

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
