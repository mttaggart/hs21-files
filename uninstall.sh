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
fi
