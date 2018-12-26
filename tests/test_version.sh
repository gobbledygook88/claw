#!/usr/bin/env bash

test_description='Display version information'
cd "$(dirname "$0")" || exit

source ./setup.sh

test_expect_success 'Can display version number (command)' '
    "$CLAW" version | grep "^v"
'

test_expect_success 'Can display version number (long form)' '
    "$CLAW" --version | grep "^v"
'

test_expect_success 'Can display version number (short form)' '
    "$CLAW" -v | grep "^v"
'

test_done