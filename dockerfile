# syntax=docker/dockerfile:1
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update \
 && apt-get install -y --no-install-recommends bash ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR ~/wsl-dev

# Copy the launcher and supporting folders. Keep context small with .dockerignore.
COPY launcher.sh ./
COPY setup.sh ./
COPY modules/ ./modules/
COPY src/ ./src/
COPY vars/ ./vars/

RUN chmod +x ./launcher.sh ./setup.sh

WORKDIR ~/dev

ENTRYPOINT ["bash", "./launcher.sh"]
