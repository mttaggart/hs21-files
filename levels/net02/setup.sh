#!/bin/bash

QUIZ=/home/hs21/hs21-files/levels/net02/quiz.json
FLAG=HS21{`curl --no-progress-meter https://passphrase.taggart-tech.com/api/pw`}

sed -ie "s/<<FLAG>>/$FLAG/g" $QUIZ
