#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
git clone -nvoorigin -ccore.abbrev=no -ccore.compression=9 -ccore.eol=lf -ccore.filemode=true -ccore.fsync=all -ccore.hidedotfiles=false -ccore.ignorecase=false -ccore.logallrefupdates=true -ccore.loosecompression=0 -ccore.trustctime=false -ccore.sharedrepository=all -ccore.symlinks=true -ccore.warnambiguousrefs=true -cfetch.all=true -cfetch.showforcedupdates=true -cfetch.writecommitgraph=true -cgc.auto=0 -cpack.compression=9 -ctransfer.fsckobjects=true -csubmodule.recurse=false --bare --mirror --progress -- "$1" "$d/$2/.git"
rm -f "$d/$2/.git/description" "$d/$2/.git/info/attributes" "$d/$2/.git/info/exclude"
rm -fr "$d/$2/.git/hooks"
