#!/bin/bash

# First, install rust
sudo apt install -y rustc

# Back up sudoers
cp /etc/sudoers /etc/sudoers.bak

# Set up users
USERDIRS=`ls levels`

# Make users
for u in $USERDIRS; do

    useradd -m -s /bin/bash $u
    # Setup the first user's password
    if [ "$u" = "start0" ]; then 
        echo start0:HS21{lets_begin} | chpasswd
        # Make finale user while we're here
        useradd -m -s /bin/bash finale
    fi
done
   
# Now, set passwords and do all setups
for u in $USERDIRS; do

    echo "Making user $u"
    #echo $u:$pw

    LEVELDIR=levels/$u
    HOMEDIR=/home/$u
    NEXT_USER=`cat $LEVELDIR/nextuser.txt`
    PW=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}
    
    # set user password
    echo $NEXT_USER:$PW | chpasswd
    
    # Copy files
    if [ -d $LEVELDIR/files ]; then
        cp -R $LEVELDIR/files/* $HOMEDIR/
        chown -R $u:$u $HOMEDIR
    fi

    # Configure quiz
    if [ -e levels/$u/quiz.json ]; then
        sed -i -e "s/<<FLAG>>/$PW/g" levels/$u/quiz.json
        cat <<EOF > /home/$u/quiz
#!/bin/bash
/home/$SUDO_USER/hs21-files/quizengine/bin/quizengine /home/$SUDO_USER/hs21-files/levels/$u/quiz.json
EOF
        chmod 755 $HOMEDIR/quiz
    fi

    # Configure test
    if [ -e $LEVELDIR/test.rs ]; then
        sed -ie "s/<<FLAG>>/$PW/g" $LEVELDIR/test.rs
        sed -ie "s/<<NEXT_USER>>/$NEXT_USER/g" $LEVELDIR/test.rs
        rustc $LEVELDIR/test.rs -o $HOMEDIR/test
        chmod 4711 $HOMEDIR/test
    fi

    # Perform any additional setup
    levelsetup=$LEVELDIR/setup.sh
    if [ -e $levelsetup ]; then
        chmod +x $levelsetup
        $levelsetup
    fi

done
