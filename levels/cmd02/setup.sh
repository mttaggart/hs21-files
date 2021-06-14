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

# Create hidden file
touch /home/cmd02/.cantseeme
chown cmd03:cmd02 /home/cmd02/.cantseeme
