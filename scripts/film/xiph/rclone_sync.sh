#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
rclone sync "--config=$d/rclone.conf" -MPcvv "a:$1" "$d/media.xiph.org/$1"
