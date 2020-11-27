#!/bin/bash

echo "UPDATING LINUX"
sudo apt-get update -y
sudo apt-get install software-properties-common -y

echo "DOWNLOADING FILES"
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update

echo "INSTALLING"
sudo apt-get install ansible -y
