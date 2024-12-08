#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
"$d/software/installed/duperemove/duperemove" -dhrvb4096 --dedupe-options=partial,same '--exclude=/mnt/a/**/duperemove.sqlite*' "$@"
