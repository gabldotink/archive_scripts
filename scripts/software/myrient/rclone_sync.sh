#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
rclone sync --config "$d/rclone.conf" --progress "a:$1" "$d/myrient.erista.me/$1"
