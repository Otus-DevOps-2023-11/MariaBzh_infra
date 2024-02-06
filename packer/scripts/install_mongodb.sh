#!/bin/bash

while ps ax | grep -i [a]pt ; do sleep 10; done;

apt-get update
apt-get install mongodb -y

sudo systemctl start mongodb
sudo systemctl enable mongodb
