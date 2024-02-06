#!/bin/bash

while ps ax | grep -i [a]pt ; do sleep 10; done;

apt-get update
apt-get install -y ruby-full ruby-bundler build-essential
