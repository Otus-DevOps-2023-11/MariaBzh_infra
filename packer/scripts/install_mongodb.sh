#!/bin/bash

apt update
apt install mongodb -y

echo 'Start mongodb...'
systemctl start mongodb
echo 'DONE'

echo 'Set automatic start mongodb...'
systemctl enable mongodb
echo 'DONE'
