FROM debian:bullseye

# Mise à jour et installation de NGINX et OpenSSL (pour le HTTPS)
RUN apt update -y && apt install -y nginx openssl

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
