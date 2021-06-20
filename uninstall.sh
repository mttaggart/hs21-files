#!/bin/bash

USERDIRS=`ls levels`

# Delete users
for u in $USERDIRS; do
    userdel -r $u
done

# Kill finale
userdel -r finale

# Reset quiz files
git reset --hard HEAD

# Fix sudoers
if [ -e /etc/sudoers.bak ]; then
    rm /etc/sudoers
    mv /etc/sudoers.bak /etc/sudoers
fi

# Check for nginx
if [ -e /usr/sbin/nginx ]; then
    apt remove -y --purge nginx
    apt autoremove
    rm -rf /etc/nginx
fi

# Remove bash challenge svc
rm /opt/bashchallengesvc

# Remove Docker image/containers
docker container prune -f
docker image rm -f dockerchallenge:latest
docker image prune -f
