# docker-compose-wordpress

**Modified configuration to be compatible with multiple wordpress sites and vhosts on Nginx**
A simplified yet refined Docker Compose workflow that sets up a LEMP network of containers for local WordPress development. If you'd like more interactive info, there's a [video tutorial](https://www.youtube.com/watch?v=kIqWxjDj4IU) that walk you through setup and usage of this environment.


## Usage

- To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

- Download the contents of wordpress in site1 and site2 folder directly with no further subfolder named `wordpress`, do the same for further wordpress websites by creating successive folders.

- Setup wordpress files permissions from here

- Setup nginx ssl certificates by adding your site to cloudfare (reference) and generating a origin server certificate following [this](https://www.digitalocean.com/community/tutorials/how-to-host-a-website-using-cloudflare-and-nginx-on-ubuntu-20-04)

- Add the vhost configurations for your websites by renaming the file `site1.com` under nginx folder and also replacing the contents inside from site1.com to your `domain-name`

- Update the nginx.dockerfile and replace site1.com with your domain name, please do the same for successive websites

- Add credentials for mysql and phpmyadmin inside docker-compose

- Next, navigate in your terminal to the directory you cloned this, and spin up the containers by running `docker-compose up -d`.

- The following container ports are built for our web server, with their exposed ports detailed:

**nginx** - `:80`
**mysql** - `:3306`
**php** - `:9000`


## Persistent MySQL Storage

By default, whenever you bring down the Docker network, your MySQL data will be removed after the containers are destroyed. To have a persistent data that remains after bringing containers down and back up, mysql folder is created in the code.

## Adding users in mysql for additional websites

- Login with mysql credentials in php-my-admin
- Add user for each additional website along with a database for their wordpress site
- Use the default user defined in dockerfile for first wordpress-setup and successive users accordingly

## Adding SSL for free

Avoid adding ssl with certbot or own certificate issuing authority rather link you website to cloudfare free account and enjoy the benefits of SSL and other security features, refer to this [video](https://www.youtube.com/watch?v=gYUZEFoFcfQ) for further details.

## Adding Mail Support for free

Coming Soon...
