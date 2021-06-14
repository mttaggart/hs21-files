#!/bin/bash

# Get uid
uid=`id | cut -d " " -f 1 | sed -e "s/uid=\([0-9]\+\)(\(.\+\))/\1/g"`

# Fill in uid
sed -ie "s/<<UID>>/$uid/g" /home/hs21/hs21-files/levels/cmd02/quiz.json

# Fix sudoers
echo "cmd02 ALL=(ALL:ALL) /home/cmd02/runasroot.sh" >> /etc/sudoers

# Fix permissions
RUNASROOT=/home/cmd02/runasroot.sh
chown root:root $RUNASROOT
chmod 711 $RUNASROOT
chmod +s $RUNASROOT


