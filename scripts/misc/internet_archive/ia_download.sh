#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
"$d/../../software/installed/internetarchive/internetarchive/cli/ia.py" download -Cat300 -R100 --destdir="$d/archive.org/download" --exclude-source=derivative "$@"
