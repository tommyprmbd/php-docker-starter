# Docker - PHP - Nginx - MySQL 
[![Version](https://badge.fury.io/gh/tommyprmbd/php-docker-starter.svg)](https://badge.fury.io/gh/tommyprmbd/php-docker-starter)
<br />
Docker running Custom PHP Image(Include Composer), Nginx & MySQL

## Overview
1. [Prerequisites](#section-prerequisites)<br />
    Before installing project make sure the following prerequisites have been met.
2. [Clone Project](#section-clone)<br />
    Download code from GitHub.
3. [Run The Application](#section-install)<br />
    Installation and run the application.
4. [Use Makefile](#section-makefile)<br />
    You can use ```Makefile``` for doing recurrent operation.
5. [Environment Configuration](#section-environment)<br />
    Default environment configuration.
6. [Support](#section-support)

## [Prerequisites](#section-prerequisites)
This project mainly created for Unix (Linux/McOS). It could be work too on Windows. Basically, this project is for Laravel project. But, it also support for other framework with minor configuration adjustment.

Before running the project, all requisites below must installed in your system:
- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

The following is optional, but makes life easier:
- [Makefile](https://itslinuxfoss.com/install-make-ubuntu-22-04/)

Images to use:
- [Nginx](https://www.nginx.com/)
- [PHP-FPM](https://hub.docker.com/repository/docker/tommyprmbd/php8.3/general) (Customized by me. Composer & NodeJS are included)
- [MySQL](https://www.mysql.com/)

## [Clone Project](#section-clone)
To clone this project, use command below
```shell
git clone git@github.com:tommyprmbd/php-docker-starter.git
```
Go to project directory
```shell
cd php-docker-starter
``` 
### Project tree
```
.
├── .docker
│   ├── compose
│   │   └── docker-compose.yml
│   ├── config
│   │   └── nginx
│   │       ├── conf.d
│   │       │   └── default.conf
│   │       ├── module.conf
│   │       │   └── fastcgi_cache.conf.example
│   │       └── nginx.conf
│   ├── data
│   │   └── mysql
│   ├── file
│   │   └── Dockerfile
│   └── nginx
│       └── module.conf
│           └── fastcgi_cache.conf.example
├── Makefile
├── README.MD
├── runner.sh
└── src
    └── public
        └── index.php
```
This project using this following ports:
|Server|Port|
|---|---|
|PHP|9000|
|MySQL|3308|
|NGINX|8000|

## [Run The Application](#section-install)
1. Make runner.sh file as executable file. Use below command to convert as executable file:
    ```shell
    chmod +x runner.sh
    ```
2. Copy environment file.
    ```shell
    cp -rv .env.example .env
    ```
    You can adjust configuration in environment if needed.
3. To run the application, you can execute either runner.sh file or Makefile (if you already install Makefile in your system).<br />
    Run using **runner.sh**
    ```shell
    ./runner.sh -a=start
    ```
    Run using **Makefile**
    ```shell
    make start
    ```
4. Open your browser, then go to:
    - http://localhost:8000

## [Use Makefile](#section-makefile)
|Name|Description|
|---|---|
|start|Build and run containers|
|restart|Restart all containers|
|stop|Stop all containers|
|down|Stop and remove all containers|
### Examples
Run the application
```shell
make start
```
Show help
```shell
make help
```

## [Environment Configuration](#section-environment)
```shell
COMPOSE_PROJECT_NAME="My Laravel Project"

# PHP-FPM configuration
PHP_CONTAINER_NAME=laravel_app
PHP_CONTAINER_BIND_PORT=9000

# NGINX configuration
NGINX_CONTAINER_NAME=laravel_nginx
NGINX_CONTAINER_BIND_PORT=8000

# MySQL configuration
MYSQL_CONTAINER_NAME=laravel_mysql
MYSQL_CONTAINER_BIND_PORT=3308
MYSQL_DATABASE=mydb
MYSQL_ROOT_PASSWORD=ROOT
MYSQL_USER=tommyprmbd
MYSQL_PASSWORD=tommyprmbd
```
### Key & Description
|Key|Description|
|---|---|
|COMPOSE_PROJECT_NAME|Project name|
| _CONTAINER_NAME|Container name|
| _CONTAINER_BIND_PORT|Container bind port. This is container's port external|
| MYSQL_DATABASE|Database name|
| MYSQL_ROOT_PASSWORD|Set user ROOT password|
| MYSQL_USER|Set MySQL username|
| MYSQL_PASSWORD|Set MySQL password|

## [Support](#section-support)
You can reach me on 
- [instagram](https://www.instagram.com/tommyprmbd)