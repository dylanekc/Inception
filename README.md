*This project has been created as part of the 42 curriculum by dylekici.*

# Description

The Inception project aims to broaden knowledge of system administration by virtualizing a complete, small-scale infrastructure using Docker. 

## Overview and Use of Docker
The objective of this project is to set up a web infrastructure composed of different services using Docker Compose, running inside a virtual machine. Each service runs in its own dedicated container, built from custom Dockerfiles using the penultimate stable version of Debian/Alpine. The infrastructure includes:
- An NGINX server acting as the sole entry point via port 443 (TLSv1.2/v1.3).
- A WordPress service configured with php-fpm.
- A MariaDB database service.

## Main Design Choices
- **Custom Images:** No ready-made images (like DockerHub's pre-configured NGINX or WordPress) were used. Every image is built locally via custom Dockerfiles.
- **Security:** Passwords and credentials are not hardcoded in the Dockerfiles but are managed via environment variables and a `.env` file.
- **Persistence:** Data is kept safe across container restarts and rebuilds through the use of dedicated Docker named volumes.
- **Isolation:** The services communicate with each other through an internal Docker bridge network, ensuring that only NGINX is exposed to the outside world.

## Technical Comparisons

### Virtual Machines vs Docker
Virtual Machines (VMs) virtualize the hardware, meaning each VM requires its own complete guest Operating System (OS), making them heavy and slow to start. Docker, on the other hand, virtualizes the OS. Containers share the host system's kernel, making them lightweight, fast, and highly portable.

### Secrets vs Environment Variables
Environment variables are injected into the container's environment and can sometimes be exposed accidentally (e.g., via `docker inspect` or application crashes). Docker Secrets provide a more secure mechanism by mounting sensitive data (like passwords or API keys) directly into the container's memory as files, reducing the risk of unauthorized access.

### Docker Network vs Host Network
Using the Host network removes network isolation between the Docker host and the containers, binding the container's ports directly to the host's network interfaces. A Docker Network (like a bridge network) creates an isolated virtual network where containers can securely resolve each other by name (DNS) without exposing their internal ports to the host or the outside world.

### Docker Volumes vs Bind Mounts
Bind mounts rely on the host machine's specific directory structure and OS file permissions, mapping a host folder directly into the container. Docker Volumes are entirely managed by Docker within a dedicated storage area on the host. Volumes are safer, easier to back up, and abstract away the host's filesystem specifics, making the containers more portable.

---

# Instructions

To run this project on your local machine:

1. **Host Configuration:**
   Ensure your local domain resolves to your local IP. Add the following line to your `/etc/hosts` file:
   `127.0.0.1 dylekici.42.fr`

2. **Environment Variables:**
   Ensure you have a valid `.env` file located in the `srcs/` directory containing all required database and WordPress credentials.

3. **Build and Run:**
   Navigate to the root directory and use the Makefile:
   ```bash

Access the Application:
    Open your browser and navigate to: `https://dylekici.42.fr:4443`

    Stop and Clean:
    To stop the containers and remove the infrastructure, run:
    Bash

    make clean

    To completely remove all containers, images, and volumes, run:
    Bash

    make fclean

Resources

    Docker Documentation

    NGINX Documentation

    MariaDB Knowledge Base

    WordPress Developer Resources

AI Usage

During the development of this project, Artificial Intelligence was used to:


    Debug Chrome caching loops and SSL certificate rejection issues (ERR_CONNECTION_REFUSED and DEPRECATED_ENDPOINT).

    Review the project structure and format the documentation files to strictly meet the subject's requirements.