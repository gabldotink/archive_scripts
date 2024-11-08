#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -exec btrfs -v filesystem defragment -fc {} ';'
