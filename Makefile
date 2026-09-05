all:
	mkdir -p /home/dylekici/data/mariadb
	mkdir -p /home/dylekici/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d --build

up:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a --force

fclean: clean
	docker compose -f srcs/docker-compose.yml down -v
	docker volume prune --force
	rm -rf /home/dylekici/data/mariadb/*
	rm -rf /home/dylekici/data/wordpress/*

re: fclean all
