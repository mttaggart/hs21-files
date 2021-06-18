#!/bin/bash

TEST_FILE=/home/netchallenge/test

echo "netchallenge ALL=(ALL:ALL) /usr/bin/apt install -y nginx, /usr/bin/vim /etc/nginx/sites-available/default" >> /etc/sudoers

chown root:root $TEST_FILE
chmod 4755 $TEST_FILE

