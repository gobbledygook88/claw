#!/usr/bin/env bash

test_description="Initialisation"
cd "$(dirname "$0")" || exit

source ./setup.sh

test_expect_success "Can call init successfully" '
    "$CLAW" init
'

# NOTE: CLAW_DIR environment variable is implictly tested via
# this test configuration (see setup.sh)
test_expect_success "CLAW_DIR is created" '
    [[ -d "$CLAW_DIR" ]] || exit 1
'

test_expect_success "Default space directory is created" '
    [[ -d "$CLAW_DIR/_default" ]] || exit 1
'

test_expect_success "Current space file exists" '
    [[ -f "$CLAW_DIR/.current_space" ]] || exit 1
'

test_expect_success "Current space file contains the correct space name" '
    [[ $(cat "$CLAW_DIR/.current_space") == "_default" ]] || exit 1
'

test_done