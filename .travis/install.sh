#!/usr/bin/env bash

# OS specific dependencies
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew install bash bash-completion git gnu-getopt shellcheck tree
else
    sudo apt-add-repository "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse"
    sudo apt-get -qq update
    sudo apt-get install shellcheck tree xclip
fi

# Common dependencies
sudo pip install --upgrade pip
sudo pip install bashate