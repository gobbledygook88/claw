#!/usr/bin/env bash

test_description="Initialisation"
cd "$(dirname "$0")" || exit

source ./setup.sh

test_expect_success "Can display usage text" '
    "$CLAW" --help | grep "Usage:"
'

test_expect_success "Configures default directory and space" '
    "$CLAW" init &&
    [[ -d "$CLAW_DIR" ]] &&
    [[ -d "$CLAW_DIR/_default" ]] &&
    [[ -f "$CLAW_DIR/.current_space" ]] &&
    [[ $(cat "$CLAW_DIR/.current_space") == "_default" ]]
'

test_done