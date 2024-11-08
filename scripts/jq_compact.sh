#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -type f -name '*.json' -exec sh -xc 'printf "%s\n" "$(jq -Mc -- . "$1")">"$1"' shell '{}' ';'
