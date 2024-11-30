#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -type f -exec btrfs -v filesystem defragment -fc {} ';'
