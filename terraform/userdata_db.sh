#!/bin/bash -v

#Waiting for internet to be avalable.
#
while true; do ping -c1 8.8.8.8 > /dev/null && break; done
#

sudo apt-get --yes update
sudo apt-get --yes --force-yes upgrade
sudo apt-get --yes --force-yes install postgresql postgresql-contrib
echo "Done"
