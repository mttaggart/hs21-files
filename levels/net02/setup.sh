#!/bin/bash

QUIZ=/home/$SUDO_USER/hs21-files/levels/net02/quiz.json
FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

sed -i -e "s/<<FLAG>>/$FLAG/g" $QUIZ
