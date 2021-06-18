#!/bin/bash

TEST_FILE=/home/netchallenge/test

FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

sed -ie "s/<<FLAG>>/$FLAG" $TEST_FILE

chmod 4711 $TEST_FILE


