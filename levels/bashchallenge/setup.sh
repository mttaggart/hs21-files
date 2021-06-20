#!/bin/bash

LEVELDIR=/home/$SUDO_USER/hs21-files/levels/bashchallenge
HOMEDIR=/home/bashchallenge
SVC_SOURCE=$LEVELDIR/bashchallengesvc.rs
SVC_DEST=/opt/bashchallengesvc
USERFILE=$HOMEDIR/users.txt
PWFILE=$HOMEDIR/passwords.txt
QUIZFILE=$LEVELDIR/quiz.json
NEXT_USER=`cat $QUIZFILE | jq -r .flag.user`
FLAG=`cat $QUIZFILE | jq -r .flag.flag`
USERCOUNT=`wc -l $USERFILE | cut -d " " -f 1`
PASSCOUNT=`wc -l $PWFILE | cut -d " " -f 1`
USER_IDX=`shuf -i 1-$USERCOUNT -n 1` 
PW_IDX=`shuf -i 1-$PASSCOUNT -n 1` 
USERNAME=`head -n $USER_IDX $USERFILE | tail -n +$USER_IDX`
PASSWORD=`head -n $PW_IDX $PWFILE | tail -n +$PW_IDX`

# Replace wildcards
sed -ie "s/<<USERNAME>>/$USERNAME/g" $SVC_SOURCE
sed -ie "s/<<PASSWORD>>/$PASSWORD/g" $SVC_SOURCE
sed -ie "s/<<NEXT_USER>>/$NEXT_USER/g" $SVC_SOURCE
sed -ie "s/<<FLAG>>/$FLAG/g" $SVC_SOURCE

# Compile/chmod service
rustc -o $SVC_DEST $SVC_SOURCE
chmod 4711 $SVC_DEST
