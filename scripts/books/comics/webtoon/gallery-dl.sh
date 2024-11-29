#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
"$d/../../../software/installed/gallery-dl/bin/gallery-dl" --config-ignore "-c$d/gallery-dl.conf" -R100 --cbz --download-archive "$d/gallery-dl_download-archive.sqlite" --no-part --write-info-json --write-metadata "$@"
