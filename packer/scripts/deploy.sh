#!/bin/bash

while ps ax | grep -i [a]pt ; do sleep 10; done;

apt-get update
apt-get install git -y

cd /home/yc-user

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install
