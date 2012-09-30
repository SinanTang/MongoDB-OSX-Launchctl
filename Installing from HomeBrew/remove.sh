#!/usr/bin/env bash

# MongoDB OSX Launchctl Item
# Author: Andrei Railean (http://andrei.md)
if [[ `whoami` != "root" ]]; then
  echo "This script must be run as root; use sudo"
  exit
fi

echo "Removing MongoDB Launchctl Item";

# create directories
# sudo mkdir -p /usr/local/var/db/mongodb
sudo rm /usr/local/var/log/mongodb.log

# create a conf file
sudo rm -rf /usr/local/etc/mongodb

# copy PLIST and (re)install it
sudo launchctl stop org.mongo.mongod
sudo launchctl unload /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo rm /System/Library/LaunchDaemons/org.mongo.mongod.plist

echo "FINISHED";
