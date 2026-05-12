FROM debian:trixie

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y lib32gcc-s1 lib32stdc++6 curl wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /stationeers

ENTRYPOINT ["./rocketstation_DedicatedServer.x86_64"]

