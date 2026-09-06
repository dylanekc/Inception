# Developer Documentation

This document provides technical instructions for developers to set up, build, and manage the Inception project.

## 1. Set Up the Environment from Scratch
Before launching the project, you must prepare the host environment:
1. **Host resolution:** Map the domain name to the localhost. Add `127.0.0.1 dylekici.42.fr` to the `/etc/hosts` file of your machine.
2. **Port Forwarding (VirtualBox):** Ensure VirtualBox network settings forward Host Port 4443 to Guest Port 443.
3. **Secrets & Config:** Create a `.env` file inside the `srcs/` directory containing all required variables (e.g., `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_ROOT_PASSWORD`, etc.).

## 2. Build and Launch the Project
The project uses a `Makefile` to simplify Docker Compose commands. To build the images and launch the containers in the background, run:
`make`

This executes `docker compose -f srcs/docker-compose.yml up -d --build`.

## 3. Manage Containers and Volumes
Here are the relevant commands for managing the infrastructure:
- **View live logs of a container:** `docker logs -f <container_name>` (e.g., nginx or wordpress).
- **Enter a running container:** `docker exec -it <container_name> bash` (or sh).
- **List all Docker volumes:** `docker volume ls`
- **Inspect a specific volume:** `docker volume inspect <volume_name>`
- **Full reset (removes containers, images, and wipes data):** `make fclean`

## 4. Data Storage and Persistence
To ensure data persists even if containers crash or are recreated, the project uses Docker local named volumes mapped to the host filesystem.
- **MariaDB Database:** Stored on the host at `/home/dylekici/data/mariadb/`.
- **WordPress Files:** Stored on the host at `/home/dylekici/data/wordpress/`.

This guarantees that website edits and database records remain intact across container lifecycles.