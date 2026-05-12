# About this repo

Running the official Stationeers dedicated server is very easy and simple, you
don't need any special software or web GUI to handle it for you. This repo uses
two simple Docker images to deploy and run the server. You could also easily do
the same thing without any containers.

Consider this repository as a guide for how to deploy and run any native Linux
game server using steamcmd and Docker.

## Preface

This repo assumes you are running in a Linux environment with Docker installed,
but the same thing can be achieved without Docker, or on a Windows host.

All commands are expected to be run from the root directory of this repository.

The deploy script assumes you want to use the stable branch. To use the beta
or other branches, refer to the [wiki][2].

You may optionally edit the `compose.yml` file to further customize the server
parameters. Refer to the [wiki][2] for guidance on the arguments.

Be aware that, by default, Docker will bypass any iptables-based firewall rules
such as `ufw` when binding ports on the host.

## Docker images

The first image is [steamcmd][1], used to deploy and update the application.

The second is a plain [debian][3] image used to run the server.

# How to use

1. Clone this repo
2. Copy `.env.example` to `.env` and fill it out

This file contains your secrets and should not be committed to source control.

Most of the server configuration is handled with this file. See `compose.yml`
for the rest.

3. Run `deploy.sh`

This script uses steamcmd to install the Stationeers server software into the
specified `PATH_INSTALL` directory. You can use this script to install and
update the Stationeers server.

* You may need to `chmod +x deploy.sh`
* You will have to run the script as a user who has Docker rights on the system
* The `PATH_INSTALL` directory will be used as a volume mount; you must
have permission to mount this directory.

4. Run `docker compose up`

This will start the server container, which will run the Stationeers server.
The image will be built when running this command for the first time.

Press `d` to detach. The server will continue running in the background.

To stop the server and container, run `docker compose down`.

# Save files

The save file directory will be mounted in the container according to the
`PATH_SAVES` option in the `.env` file. This allows you to store your save
files separately from the rest of the application files, which don't need
to be included in any backups.

[1]: https://hub.docker.com/r/steamcmd/steamcmd
[2]: https://stationeers-wiki.com/Dedicated_Server_Guide#DIY_Solutions
[3]: https://hub.docker.com/_/debian

