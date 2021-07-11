#!/bin/bash

HOMEDIR=/home/dockerchallenge
LEVELDIR=/home/$SUDO_USER/hs21-files/levels/dockerchallenge

# Remove extraneous quiz
rm $HOMEDIR/quiz

# Add user to docker group
gpasswd -a dockerchallenge docker

NEXT_USER=`cat $LEVELDIR/quiz.json | jq -r .flag.user`
FLAG=`cat $LEVELDIR/quiz.json | jq -r .flag.flag`

sed -i -e "s/<<NEXT_USER>>/$NEXT_USER/g" $LEVELDIR/Dockerfile
sed -i -e "s/<<FLAG>>/$FLAG/g" $LEVELDIR/Dockerfile

# Build Docker image
docker image build --quiet -t "dockerchallenge:latest" $LEVELDIR/
