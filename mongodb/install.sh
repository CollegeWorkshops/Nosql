#!/bin/sh

#Import the MongoDB public GPG key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

#Add the 10gen package to get the latest stable mongodb release
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

#Reload your repository
sudo apt-get update

#Install MongoDB
sudo apt-get install mongodb-10gen

#Make the data directories
sudo mkdir /data
sudo chmod 777 /data
mkdir /data/node1
mkdir /data/node2
mkdir /data/node3

