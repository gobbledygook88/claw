#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

find "$DIR/.." -name "*.sh" -exec shellcheck {} +
find "$DIR/.." -name "*.sh" -exec bashate -i E002,E003 {} +
