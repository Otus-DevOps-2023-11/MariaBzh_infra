#!/bin/bash

sudo apt update
sudo apt install git -y

cd /home/yc-user

git clone -b monolith https://github.com/express42/reddit.git

echo 'Start bundle install...'
cd reddit && bundle install
echo 'DONE'

echo 'Start app...'
puma -d

echo 'App started at...'
echo $(ps -e -o command | grep -a puma | head -1)
