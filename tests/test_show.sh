#!/usr/bin/env bash

test_description='Display saved commands'
cd "$(dirname "$0")" || exit

source ./setup.sh

# Mock test files
COMMAND_SINGLE="echo foobar"
COMMAND_MULTI="while read -r line; do
  echo foobar ;
done"

TEST_DIR="$CLAW_DIR/_default/deeply/nested"
COMMAND_SINGLE_PATH="$TEST_DIR/single"
COMMAND_MULTI_PATH="$TEST_DIR/multi"

# Initialise claw first
"$CLAW" init > /dev/null 2>&1

mkdir -p "$TEST_DIR"

echo "$COMMAND_SINGLE" > "$COMMAND_SINGLE_PATH"
echo "$COMMAND_MULTI" > "$COMMAND_MULTI_PATH"

# Start testing
test_expect_success 'Print out single-line saved command (in current space)' '
    [[ $("$CLAW" show deeply/nested/single) == "$COMMAND_SINGLE" ]]
'

test_expect_success 'Print out multi-line saved command (in current space)' '
    [[ $("$CLAW" show deeply/nested/multi) == "$COMMAND_MULTI" ]]
'

# TODO
test_expect_success 'Print out saved command (in another space)' '

'

test_expect_success 'Error when command path does not exist' '
    test_must_fail "$CLAW" show this/does/not/exist/anywhere
'

test_expect_success 'Copy command contents to clipboard (single line)' '
    "$CLAW" show -c deeply/nested/single &&
    [[ $($CLIPBOARD) == "$COMMAND_SINGLE" ]]
'

test_expect_success 'Copy command contents to clipboard (multi-line)' '
    "$CLAW" show -c deeply/nested/multi &&
    [[ $($CLIPBOARD) == "$COMMAND_MULTI" ]]
'

test_expect_success 'Print out full filepath (single line)' '
    [[ $("$CLAW" show -p deeply/nested/single) == "$COMMAND_SINGLE_PATH" ]]
'

test_expect_success 'Print out full filepath (multi-line)' '
    [[ $("$CLAW" show -p deeply/nested/multi) == "$COMMAND_MULTI_PATH" ]]
'

test_done
