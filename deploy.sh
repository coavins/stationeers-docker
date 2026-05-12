#!/bin/bash
[ -f .env ] && source .env

docker run --rm -it \
	--security-opt seccomp=unconfined \
	-v $PATH_INSTALL:/data \
	steamcmd/steamcmd:latest \
	+force_install_dir /data +login anonymous +app_update $STEAM_APP_ID validate +quit

