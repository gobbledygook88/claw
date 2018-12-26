#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Run shellcheck on only src directory
find "$DIR/../src" \
    -name "*.sh" \
    -exec shellcheck -x {} +

# Run bashate on all shell scripts (including tests)
find "$DIR/.." \
    -name "*.sh" \
    -not -name "sharness.sh" \
    -not -name "aggregate-results.sh" \
    -exec bashate -i E002,E003 {} +
