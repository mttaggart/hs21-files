#!/bin/bash

# Get uid
uid=`id | cut -d " " -f 1 | sed -e "s/uid=[0-9]\+(\(.\+\))/\1/g"`

# Fill in uid
sed -ie "s/<<UID>>/$uid/g" quiz.json

# Fix sudoers
echo "cmd02 ALL=(ALL:ALL) /home/cmd02/runasroot.sh" >> /etc/sudoers

# Fix permissions
chown root:root runasroot.sh
chmod 711 runasroot.sh
chmod +s runasroot.sh

