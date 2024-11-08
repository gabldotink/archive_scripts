#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
"$d/git_clone.sh" "https://github.com/$1.git" "github.com/$1"
