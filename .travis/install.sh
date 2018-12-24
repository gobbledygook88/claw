#!/bin/bash

# OS specific dependencies
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew install shellcheck
else
    sudo apt-get install shellcheck
fi

# Common dependencies
sudo pip install bashate