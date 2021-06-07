#!/bin/bash

USERDIRS=`ls levels`

# Delete users
for u in $USERDIRS; do
    userdel -r $u
done

# Reset quiz files
git reset --hard HEAD
