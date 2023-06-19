# docker-compose-wordpress

**Modified configuration to be compatible with multiple wordpress sites and vhosts on Nginx**
A simplified yet refined Docker Compose workflow that sets up a LEMP network of containers for local WordPress development. If you'd like more interactive info, there's a [video tutorial](https://www.youtube.com/watch?v=kIqWxjDj4IU) that walk you through setup and usage of this environment.


## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

Next, navigate in your terminal to the directory you cloned this, and spin up the containers for the web server by running `docker-compose up -d`.

After that completes, download the contents of wordpress in site1 and site2 folder directly with no further subfolder named `wordpress`.

The following container ports are built for our web server, with their exposed ports detailed:

- **nginx** - `:80`
- **mysql** - `:3306`
- **php** - `:9000`


## Persistent MySQL Storage

By default, whenever you bring down the Docker network, your MySQL data will be removed after the containers are destroyed. To have a persistent data that remains after bringing containers down and back up, mysql folder is created in the code.

## Adding SSL

Avoid adding ssl with certbot or own certificate issuing authority rather link you website to cloudfare free account and enjoy the benefits of SSL and other security features, refer to this [video](https://www.youtube.com/watch?v=gYUZEFoFcfQ) for further details.
