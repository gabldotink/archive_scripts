#!/bin/sh
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
rsync -AUXarv --delete --fsync --progress "rsync://media.xiph.org/$1" "$d/media.xiph.org/$1"
