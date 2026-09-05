FROM debian:bullseye

RUN printf 'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260824T000000Z bullseye-security main\n\
deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye-updates main\n' \
> /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y --no-install-recommends mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copie du fichier de configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copie du script d'initialisation (qui lira ton fichier .env)
COPY conf/init.sh /init.sh

RUN chmod +x /init.sh

# On lance le script au démarrage du conteneur
ENTRYPOINT ["/init.sh"]
