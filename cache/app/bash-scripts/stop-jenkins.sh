#/bin/bash
echo "[Docker] Stopping the Jenkins container"
docker stop jenkins-blueocean
docker remove jenkins-blueocean
docker network remove jenkins
