#!/usr/bin/env bash

test_description='Search for saved commands'
cd "$(dirname "$0")" || exit

source ./setup.sh

# Mock test files
COMMAND_SINGLE="echo foobar"

TEST_DIR="$CLAW_DIR/_default/deeply/nested"
COMMAND_SINGLE_PATH="$TEST_DIR/single"

# Initialise claw first
"$CLAW" init > /dev/null 2>&1

mkdir -p "$TEST_DIR"

echo "$COMMAND_SINGLE" > "$COMMAND_SINGLE_PATH"
"$CLAW" find deeply/nested/single
# Start testing
test_expect_success 'Search saved command by full path (in current space)' '
    [[ $("$CLAW" find deeply/nested/single) == "deeply/nested/single ]]
'

test_expect_success 'Search saved command by partial match (in current space)' '
    [[ $("$CLAW" find nest) == "deeply/nested" ]]
'

test_expect_success 'Search saved command by partial match (in current space)' '
    [[ $("$CLAW" find sing) == "deeply/nested/single" ]]
'

# TODO
test_expect_success 'Search saved command by partial match (in all spaces)' '

'

test_expect_success 'Error when search query does not return any results' '
    test_must_fail "$CLAW" find this/does/not/exist/anywhere
'

test_expect_success 'Error when too many arguments are supplied' '
    test_must_fail "$CLAW" find query more_stuff
'

test_done
