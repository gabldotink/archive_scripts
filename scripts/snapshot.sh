#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
btrfs -v subvolume snapshot -r "$d" "$d/.snapshots/$(date -u '+%Y-%m-%dT%H:%M:%S+00:00')"
