#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
for i in $(curl -LH 'Accept: application/vnd.github+json' -H 'X-GitHub-Api-Version: 2022-11-28' "https://api.github.com/$1/repos?per_page=100"|jq -Mr .[].full_name)
do export i
"$d/git_clone_github.sh" "$i"
done
