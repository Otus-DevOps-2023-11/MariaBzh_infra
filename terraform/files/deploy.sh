#!/bin/bash

set -e

APP_DIR=${1:-$HOME}

while ps ax | grep -i [a]pt ; do sleep 10; done;

sudo apt-get install -y git

sudo rm -r $APP_DIR/reddit

git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit

cd $APP_DIR/reddit

bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service

sudo systemctl start puma
sudo systemctl enable puma
