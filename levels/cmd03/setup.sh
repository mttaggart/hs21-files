#!/bin/bash

QUIZ_FILE=/home/$SUDO_USER/hs21-files/levels/cmd03/quiz.json

# Get flags
FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
GREPFLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
FINDFLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

# Setup find
mkdir -p /tmp/hs21/cmd03
echo $FLAG > /tmp/hs21/cmd03/cmd03flag.txt

# Setup runme
sed -ie "s/<<QUIZ_FILE>>/$QUIZ_FILE/g" /home/cmd03/runme
sed -ie "s/<<FLAG>>/$FLAG/g" $QUIZ_FILE
sed -ie "s/<<GREPFLAG>>/$GREPFLAG/g" $QUIZ_FILE
sed -ie "s/<<FINDFLAG>>/$FINDFLAG/g" $QUIZ_FILE

chmod 711 /home/cmd03/runme
