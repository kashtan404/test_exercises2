#!/bin/bash -v

#Waiting for internet to be avalable.
#
while true; do ping -c1 8.8.8.8 > /dev/null && break; done
#

sudo apt-get --yes update
sudo apt-get --yes --allow-downgrades --allow-remove-essential --allow-change-held-packages upgrade
sudo apt-get --yes --allow-downgrades --allow-remove-essential --allow-change-held-packages install python python-pip
sudo pip install docker
sudo apt-get --yes --allow-downgrades --allow-remove-essential --allow-change-held-packages install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get --yes --allow-downgrades --allow-remove-essential --allow-change-held-packages install docker-ce
echo "Done"
