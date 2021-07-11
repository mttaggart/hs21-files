#!/bin/bash

# First, install rust and jq
sudo apt install -y rustc jq docker.io

# Back up sudoers
cp /etc/sudoers /etc/sudoers.bak

# Install quiz engine
cargo install --git https://github.com/mttaggart/hsquiz --branch main
QUIZENGINE_BINPATH=/root/.cargo/bin/hsquiz

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

    LEVELDIR=/home/$SUDO_USER/hs21-files/levels/$u
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
    if [ -e $LEVELDIR/quiz.json ]; then
        QUIZ_TEMPLATE=./quiztemplate.rs
        QUIZFILE=$LEVELDIR/quiz.json
        QUIZ_SRC=$LEVELDIR/quiz.rs
        QUIZ_DEST=$HOMEDIR/quiz
        cp $QUIZ_TEMPLATE $QUIZ_SRC
        sed -i -e "s@<<QUIZENGINE_BINPATH>>@$QUIZENGINE_BINPATH@g" $QUIZ_SRC
        sed -i -e "s@<<QUIZFILE>>@$QUIZFILE@g" $QUIZ_SRC
        rustc -o $QUIZ_DEST $QUIZ_SRC

        sed -i -e "s/<<FLAG>>/$PW/g" $QUIZFILE
        #cat <<EOF > /home/$u/quiz
#!/bin/bash
#/home/$SUDO_USER/hs21-files/quizengine/bin/quizengine /home/$SUDO_USER/hs21-files/levels/$u/quiz.json
#EOF
        chmod 4755 $QUIZ_DEST
    fi

    # Perform any additional setup
    levelsetup=$LEVELDIR/setup.sh
    if [ -e $levelsetup ]; then
        chmod +x $levelsetup
        $levelsetup
    fi
    
    # Configure test
    if [ -e $LEVELDIR/test.rs ]; then
        sed -i -e "s/<<FLAG>>/$PW/g" $LEVELDIR/test.rs
        sed -i -e "s/<<NEXT_USER>>/$NEXT_USER/g" $LEVELDIR/test.rs
        rustc $LEVELDIR/test.rs -o $HOMEDIR/test
        chmod 4711 $HOMEDIR/test
    fi

done

# Make root user unreadable by everyone else
chmod 700 /home/$SUDO_USER/hs21-files
echo "Setup complete! Login to user start0 with the password HS21{lets_begin}."
