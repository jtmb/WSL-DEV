#!/usr/bin/env bash
# docker-init.sh

USER=$(whoami)

# copy container defaults if missing
for f in /etc/skel/.*; do
    [ -e "$f" ] || continue
    base=$(basename "$f")
    [ -e "/dev-box/home/$base" ] || cp -r "$f" "/dev-box/home/$base"
done

# Fix ownership of APT directories and /wsl-dev
sudo chown -R ubuntu:ubuntu /wsl-dev /home/ubuntu/dev /usr/local/bin/ ubuntu:ubuntu /scripts /home/ubuntu/.bashrc
sudo cp /etc/skel/.bashrc /home/ubuntu/
sudo cp /etc/skel/.profile /home/ubuntu/
sudo cp /etc/skel/.bash_logout /home/ubuntu/
sudo chown ubuntu:ubuntu /var/run/docker.sock
sudo usermod -aG docker ubuntu


sudo tee /etc/bash.bashrc >/dev/null <<'EOF'

# ---- Container Banner ----
[[ $- != *i* ]] && return

echo
cat << "BANNER"
██████╗ ███████╗██╗   ██╗    ██████╗  ██████╗ ██╗  ██╗
██╔══██╗██╔════╝██║   ██║    ██╔══██╗██╔═══██╗╚██╗██╔╝
██║  ██║█████╗  ██║   ██║    ██████╔╝██║   ██║ ╚███╔╝ 
██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔══██╗██║   ██║ ██╔██╗ 
██████╔╝███████╗ ╚████╔╝     ██████╔╝╚██████╔╝██╔╝ ██╗
╚═════╝ ╚══════╝  ╚═══╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
https://github.com/jtmb
BANNER
echo
# ---- End Banner ----

EOF

# Keep container alive
exec bash
