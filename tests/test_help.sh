#!/usr/bin/env bash

test_description="Help text"
cd "$(dirname "$0")" || exit

source ./setup.sh

test_expect_success "Can display usage text (command)" '
    "$CLAW" help | grep "Usage:"
'

test_expect_success "Can display usage text (long form)" '
    "$CLAW" --help | grep "Usage:"
'

test_expect_success "Can display usage text (short form)" '
    "$CLAW" -h | grep "Usage:"
'

test_expect_success "Can display usage text (no arguments)" '
    "$CLAW" | grep "Usage:"
'

test_done