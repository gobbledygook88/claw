#!/usr/bin/env bash

unset CLAW_DIR
unset CLAW_DEFAULT_SPACE
unset EDITOR

TEST_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$TEST_HOME/sharness.sh"

export CLAW_DIR="$SHARNESS_TRASH_DIRECTORY/test-claw"
rm -rf "$CLAW_DIR"
mkdir -p "$CLAW_DIR"
if [[ ! -d "$CLAW_DIR" ]]; then
    echo "Could not create $CLAW_DIR"
    exit 1
fi

CLAW="$TEST_HOME/../src/claw.sh"
if [[ ! -e "$CLAW" ]]; then
    echo "Could not find claw.sh"
    exit 1
fi