all:
	mkdir -p /home/dylekcii/data/mariadb
	mkdir -p /home/dylekcii/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build

up:
	cd srcs && docker-compose up -d --build

down:
	cd srcs && docker-compose down

clean: down
	docker system prune -a --force

fclean: clean
	docker volume prune --force

re: fclean all

.PHONY: all up down clean fclean re
