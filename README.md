*This project has been created as part of the 42 curriculum by <ton_login>.*

# Inception - Memo & Documentation

## Description
Ce projet vise à élargir les connaissances en administration système en virtualisant plusieurs images Docker dans une machine virtuelle personnelle. L'objectif est de mettre en place une petite infrastructure web stricte sous des règles spécifiques.

## 🛠️ L'Infrastructure et l'Orchestration
* **Machine Virtuelle (VM)** : L'environnement de travail isolé sur lequel tu dois obligatoirement réaliser tout ton projet.
* **Docker Compose (`docker-compose.yml`)** : L'outil et son fichier de configuration qui te permettent de lier et de lancer tous tes services en même temps.
* **Makefile** : Le script situé à la racine de ton projet qui va automatiser la construction et le déploiement de toute ton application via `docker-compose.yml`.

## 🐳 L'Écosystème Docker
* **Dockerfile** : Le fichier contenant les instructions (la recette) que tu vas écrire pour construire tes propres images manuellement.
* **Image Docker** : Le modèle de base contenant l'OS et les logiciels pré-installés, généré à partir de ton `Dockerfile`.
* **Conteneur Docker** : L'instance vivante, en cours d'exécution, de ton image Docker, qui héberge ton service.
* **Docker Network** : Le réseau virtuel sécurisé qui permet à tes conteneurs de communiquer uniquement entre eux.
* **Volumes Docker (nommés)** : Les espaces de stockage persistants configurés sur ta machine hôte pour ne pas perdre les données quand un conteneur s'arrête.
* **PID 1** : Le tout premier processus lancé dans un conteneur, que tu devras gérer proprement pour que le conteneur reste actif sans utiliser de bidouillages (comme les boucles infinies).

## 💻 Les Systèmes et Logiciels
* **Alpine ou Debian** : Les deux seuls systèmes d'exploitation légers (OS) autorisés pour servir de base à tes images Docker.
* **NGINX** : Le serveur web qui agira comme l'unique point d'entrée de ton infrastructure.
* **TLSv1.2 ou TLSv1.3** : Le protocole de sécurité obligatoire que tu devras configurer sur NGINX pour chiffrer la connexion (le "S" de HTTPS) sur le port 443.
* **MariaDB** : Le moteur de base de données autonome où seront stockées toutes les informations de ton site.
* **WordPress + php-fpm** : L'outil de création de site web et le moteur PHP nécessaire pour le faire fonctionner, regroupés dans un seul conteneur.

## 🔐 La Sécurité
* **Fichier `.env`** : Le fichier externe utilisé pour stocker tes mots de passe et configurations secrètes afin de ne jamais les exposer dans ton code source.

---

## Instructions
1. Cloner le dépôt sur la machine virtuelle.
2. Configurer le fichier `.env` dans le dossier `srcs` avec les variables requises (ex: nom de domaine, mots de passe).
3. Lancer la commande `make` à la racine pour construire et démarrer l'infrastructure.
4. Accéder au site via `https://<ton_login>.42.fr`.

## Comparaisons Techniques & Choix d'Architecture
*(Section obligatoire à compléter selon tes recherches)*
* **Virtual Machines vs Docker:** ...
* **Secrets vs Environment Variables:** ...
* **Docker Network vs Host Network:** ...
* **Docker Volumes vs Bind Mounts:** ...

## Ressources
* [Documentation Docker](https://docs.docker.com/)
* [Utilisation de l'Intelligence Artificielle] : *(À compléter si l'IA a été utilisée pour t'assister sur ce projet)*



wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.7.0-amd64-netinst.iso


nano /etc/hosts | l'annuaire local (ip)

apt update | mettre a jour la liste logiciel debian 

apt install docker.io docker-compose -y | installer docker et docker compose

usermod -aG docker dylekici | ajoute lutilisateur groupe secret doker , permet lancer conteneur sans le mode root

.env | lors de lexercution de example (mariadb) je vais recupere les inforamation confidentiel que jai pas envie de partager en public (mot de passe et identifiant)


nano srcs/docker-compose.yml |