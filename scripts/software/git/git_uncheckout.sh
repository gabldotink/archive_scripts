#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -type d -name .git -execdir sh -xc 'git config --local --no-includes --no-type --replace-all -- core.bare true
find . ! "(" -name . -o -name .. -o -name .git -o -path "**/.git/**" ")" -exec rm -fr "{""}" ";"' ';'
exit 0
