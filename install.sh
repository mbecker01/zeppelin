#!/bin/sh
set -e

# This script is meant for quick & easy install via:
#   $ curl -fsSL https://github.com/mbecker01/zeppelin/blob/master/install.sh -o install.sh | sh
######

yum -y update
yum -y install yum-utils

yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum -y install docker-ce

systemctl start docker

systemctl enable docker

docker run --restart always -p 80:8080 skymindops/zeppelin-dl4j:latest 2>&1 >/dev/null

