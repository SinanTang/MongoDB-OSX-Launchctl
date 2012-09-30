#!/usr/bin/env bash

# MongoDB OSX Launchctl Item
# Author: Andrei Railean (http://andrei.md)
if [[ `whoami` != "root" ]]; then
  echo "This script must be run as root; use sudo"
  exit
fi

echo "Installing MongoDB Launchctl Item";

# create directories
sudo mkdir -p /opt/local/var/db/mongodb
sudo mkdir -p /opt/local/var/log/
sudo touch /opt/local/var/log/mongodb.log

# create a conf file
sudo mkdir -p /opt/local/etc/mongodb
sudo cp mongod.conf /opt/local/etc/mongodb/

# copy PLIST and (re)install it
sudo cp org.mongo.mongod.plist /System/Library/LaunchDaemons/.
sudo chown root:wheel /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl load /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl start org.mongo.mongod

echo "FINISHED";
