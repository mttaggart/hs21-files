#!/bin/bash

# Set up users
USERDIRS=`ls levels`

# Make start0
useradd -m -s /bin/bash start0
echo start0:HS21{lets_begin} | chpasswd

for u in $USERDIRS; do
    pw=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
    echo "Making user $u"
    #echo $u:$pw
    
    # Make user
    useradd -m -s /bin/bash $u
    echo $u:HS21{$pw} | chpasswd

    LEVELDIR=levels/$u

    # Copy files
    if [ -d $LEVELDIR/files ]; then
        cp -R levels/$u/files/* /home/$u/
        chown -R $u:$u /home/$u
    fi

    # Configure quiz
    if [ -e levels/$u/quiz.json ]; then
        sed -i -e "s/<<FLAG>>/$pw/g" levels/$u/quiz.json
    fi

    # Perform any additional setup
    levelsetup=levels/$u/setup.sh
    if [ -e $levelsetup ]; then
        chmod +x $levelsetup
        levels/$u/setup.sh
        $levelsetup
    fi

done
