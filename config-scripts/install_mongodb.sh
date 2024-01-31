#!/bin/bash

sudo apt update
sudo apt install mongodb -y

echo 'Start mongodb...'
sudo systemctl start mongodb
echo 'DONE'

echo 'Set automatic start mongodb...'
sudo systemctl enable mongodb
echo 'DONE'
