# syntax=docker/dockerfile:1
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update \
 && apt-get install -y --no-install-recommends bash ca-certificates sudo \
    python3-pip \
    software-properties-common \
    bash \
    ca-certificates \
    sudo \
    wget \
    unzip \
    curl \
    git \
    net-tools \
 && rm -rf /var/lib/apt/lists/*


# App directory separate from home
WORKDIR /wsl-dev

# Copy launcher and supporting folders into /wsl-dev
COPY launcher.sh /wsl-dev/launcher.sh
COPY setup.sh /wsl-dev/setup.sh
COPY modules/ /wsl-dev/modules/
COPY src/ /wsl-dev/src/
COPY vars/ /wsl-dev/vars/
RUN chmod +x /wsl-dev/launcher.sh /wsl-dev/setup.sh
RUN mkdir -p /home/ubuntu \
 && chown -R ubuntu:ubuntu /home/ubuntu
RUN mkdir -p /scripts \
 && chown -R ubuntu:ubuntu /scripts
RUN touch /home/ubuntu/.bashrc \
 && chown ubuntu:ubuntu /home/ubuntu/.bashrc
COPY docker-init.sh /usr/local/bin/docker-init.sh
RUN chmod +x /usr/local/bin/docker-init.sh


# Create a global launcher wrapper that always runs from /wsl-dev with sudo
RUN echo -e '#!/usr/bin/env bash\ncd /wsl-dev && exec /wsl-dev/launcher.sh "$@"' \
    > /usr/local/bin/launcher \
 && chmod +x /usr/local/bin/launcher
# Allow ubuntu user to run sudo without password
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# Make APT directories writable by ubuntu user

# Switch to the non-root user
USER ubuntu
ENV HOME=/home/ubuntu
WORKDIR /home/ubuntu/dev
# Fix APT volume permissions on container start
# ENTRYPOINT ["bash", "-c", "sudo chown -R ubuntu:ubuntu /var/lib/apt /var/lib/dpkg /var/cache/apt /wsl-dev && /wsl-dev/launcher.sh"]
ENTRYPOINT ["/usr/local/bin/docker-init.sh"]
