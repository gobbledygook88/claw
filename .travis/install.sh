#!/bin/bash

# OS specific dependencies
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew install shellcheck
else
    sudo apt-add-repository "deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse"
    sudo apt-get -qq update
    sudo apt-get install shellcheck
fi

# Common dependencies
sudo pip install bashate