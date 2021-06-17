#!/bin/bash

QUIZ=/home/hs21/hs21-files/levels/net01/quiz.json
IP=`ip a s enp0s3 | grep "inet 10" | tr -s " " | cut -d " " -f 3 | sed "s/\/.\+//g"`
GATEWAY=`ip r | grep default | cut -d " " -f 3`
FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

sed -ie "s/<<IP>>/$IP/g" $QUIZ
sed -ie "s/<<GATEWAY>>/$GATEWAY/g" $QUIZ
sed -ie "s/<<FLAG>>/$FLAG/g" $QUIZ
