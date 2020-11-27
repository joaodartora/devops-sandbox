#!/bin/bash

echo "UPDATING LINUX"
sudo apt-get update -y

echo "DOWNLOADING FILES"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "GIVING PERMISSIONS"
sudo chmod +x /usr/local/bin/docker-compose

echo "INSTALLING"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
