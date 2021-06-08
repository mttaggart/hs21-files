#!/bin/bash

USERDIRS=`ls levels`

# Delete users
for u in $USERDIRS; do
    userdel -r $u
done

# Kill start0
userdel -r start0

# Reset quiz files
git reset --hard HEAD
