#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -exec sh -xc 'chown -c nobody: "$1"
chmod -c a+wrX "$1"
btrfs -v property set "$1" compression ""' shell {} ';'
