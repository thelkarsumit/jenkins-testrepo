#/bin/bash
docker system prune
clear
echo "[Docker] Building the Jenkins image"
docker build -t myjenkins-blueocean:2.414.2 .