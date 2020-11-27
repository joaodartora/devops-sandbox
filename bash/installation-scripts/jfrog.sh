#!/bin/bash

echo "UPDATING LINUX"
sudo apt-get update -y

echo "DOWNLOADING FILES"
wget 'https://api.bintray.com/content/jfrog/artifactory/jfrog-artifactory-oss-$latest.zip;bt_package=jfrog-artifactory-oss-zip' -O artifactory.zip

echo "UNZIPPING FILES"
unzip artifactory/

echo "INSTALLING"
sudo artifactory/bin/./installService.sh

echo "RUNNING ARTIFACTORY"
sudo service artifactory start

