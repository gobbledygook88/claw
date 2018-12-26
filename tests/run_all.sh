#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR" || exit 1

TEST_FILES="$(find . -type f -name 'test_*.sh' -exec basename {} \;)"
NUM_TEST_FILES="$(echo "$TEST_FILES"  | tr ' ' '\n' | wc -l | awk '{print $1}')"

echo "Found $NUM_TEST_FILES test files."

while read -r file ; do
    echo "========== $file =========="
    "./$file"
done < <(echo "$TEST_FILES" | tr ' ' '\n')