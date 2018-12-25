#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

find "$DIR/.." \
    -name "*.sh" \
    -not -name "sharness.sh" \
    -not -name "aggregate-results.sh" \
    -exec shellcheck -x {} +
find "$DIR/.." \
    -name "*.sh" \
    -not -name "sharness.sh" \
    -not -name "aggregate-results.sh" \
    -exec bashate -i E002,E003 {} +
