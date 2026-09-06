# User Documentation

This document explains how to use and manage the Inception infrastructure.

## 1. Services Provided by the Stack
This project sets up a complete web infrastructure using Docker:
- **NGINX**: The web server and the only entry point to the infrastructure (HTTPS).
- **WordPress**: The Content Management System (CMS) to manage the website.
- **MariaDB**: The database storing all WordPress data.

## 2. Start and Stop the Project
To start the project, open a terminal in the root directory and run:
`make`

To stop the project without losing data:
`make down`

To stop and remove containers and networks:
`make clean`

## 3. Access the Website and Administration Panel
*Note: Due to macOS restrictions on school computers, VirtualBox forwards port 4443 to port 443.*
- **Website:** Open your browser and go to `https://dylekici.42.fr:4443/`
- **Admin Panel:** Go to `https://dylekici.42.fr:4443/wp-admin/`

## 4. Locate and Manage Credentials
All sensitive information, passwords, and database credentials are kept strictly private. They are located in the environment file at `srcs/.env`. 
To manage or update credentials, you must edit this `.env` file before starting the infrastructure.

## 5. Check that Services are Running Correctly
To verify that all services are up and running smoothly, use the following Docker command:
`docker ps`

You should see three containers running (nginx, wordpress, mariadb) with the status "Up".