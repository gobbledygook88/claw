#!/bin/bash

# OS specific dependencies
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    brew install shellcheck
else
    apt-get install shellcheck
fi

# Common dependencies
pip install bashate