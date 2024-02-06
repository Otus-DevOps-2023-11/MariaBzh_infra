#!/bin/bash

yc compute instance create \
  --name reddit \
  --hostname reddit \
  --create-boot-disk image-family=reddit-full \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
