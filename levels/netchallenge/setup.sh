#!/bin/bash

echo "netchallenge ALL=(ALL:ALL) /usr/bin/apt install -y nginx, /usr/bin/systemctl restart nginx, /usr/bin/vim /etc/nginx/sites-available/default" >> /etc/sudoers
