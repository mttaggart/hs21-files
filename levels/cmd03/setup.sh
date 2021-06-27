#!/bin/bash

QUIZ_FILE=/home/$SUDO_USER/hs21-files/levels/cmd03/quiz.json
RUNME=/home/cmd03/runme

# Get flags
FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
GREPFLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
FINDFLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

# Setup find
mkdir -p /tmp/hs21/cmd03
echo $FINDFLAG > /tmp/hs21/cmd03/cmd03flag.txt

# Setup runme
echo "Setting up runme"
sed -i -e "s@<<QUIZ_FILE>>@$QUIZ_FILE@g" /home/cmd03/runme

# Setup quiz file
echo "Setting up quiz file"
sed -i -e "s/<<FLAG>>/$FLAG/g" $QUIZ_FILE
sed -i -e "s/<<GREPFLAG>>/$GREPFLAG/g" $QUIZ_FILE
sed -i -e "s/<<FINDFLAG>>/$FINDFLAG/g" $QUIZ_FILE

# Add sudoers
echo "cmd03 ALL=(ALL:ALL) /home/cmd03/runme" >> /etc/sudoers

# Change runme perms
chown root:root $RUNME
chmod 4755 $RUNME

