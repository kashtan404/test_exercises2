#!/bin/bash -v

#Waiting for internet to be avalable.
#
while true; do ping -c1 8.8.8.8 > /dev/null && break; done
#

sudo apt-get --yes update
sudo apt-get --yes --force-yes upgrade
sudo apt-get --yes --force-yes install php php-fpm php-curl php-cli php-pgsql
sudo apt --purge remove *apache*
sudo apt-get --yes --force-yes install nginx nginx-common
echo "Done"
