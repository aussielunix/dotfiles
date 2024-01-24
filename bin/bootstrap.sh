#!/bin/bash

mkdir $HOME/bin
curl --silent -fLo $HOME/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x $HOME/bin/yadm
$HOME/bin/yadm clone --bootstrap git@gitlab-01.hl.valueline.io:aussielunix/dotfiles.git
$HOME/bin/yadm checkout $HOME
echo "Your dotfiles are in place."
echo "Logout and back in and then run 'yadm decrypt'"
