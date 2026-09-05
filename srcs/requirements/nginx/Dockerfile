FROM debian:bullseye

RUN printf 'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260824T000000Z bullseye-security main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye-updates main\n' \
> /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Création du dossier pour le certificat de sécurité
RUN mkdir -p /etc/nginx/ssl

# Génération du certificat SSL
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=dylekici.42.fr/UID=dylekici"

# Copie de ton futur fichier de configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Création du dossier web et attribution des droits
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Commande pour garder le serveur allumé
CMD [ "nginx", "-g", "daemon off;" ]
