FROM debian:bullseye

# Installation de MariaDB
RUN apt update -y && apt install -y mariadb-server

# Copie du fichier de configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copie du script d'initialisation (qui lira ton fichier .env)
COPY conf/init.sh /init.sh

RUN chmod +x /init.sh

# On lance le script au démarrage du conteneur
ENTRYPOINT ["/init.sh"]