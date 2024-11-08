#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
"$d/git_clone.sh" "https://gist.github.com/$1" "gist.github.com/$1"
