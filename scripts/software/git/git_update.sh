#!/bin/sh
set -x
export POSIXLY_CORRECT
find "$1" -type d -name .git -execdir sh -xc 'git config --local --no-includes --no-type --replace-all -- core.abbrev no
git config --local --no-includes --no-type --replace-all -- core.compression 9
git config --local --no-includes --no-type --replace-all -- core.eol lf
git config --local --no-includes --no-type --replace-all -- core.filemode true
git config --local --no-includes --no-type --replace-all -- core.fsync all
git config --local --no-includes --no-type --replace-all -- core.hidedotfiles false
git config --local --no-includes --no-type --replace-all -- core.ignorecase false
git config --local --no-includes --no-type --replace-all -- core.logallrefupdates true
git config --local --no-includes --no-type --replace-all -- core.loosecompression 0
git config --local --no-includes --no-type --replace-all -- core.trustctime false
git config --local --no-includes --no-type --replace-all -- core.sharedrepository all
git config --local --no-includes --no-type --replace-all -- core.symlinks true
git config --local --no-includes --no-type --replace-all -- core.warnambiguousrefs true
git config --local --no-includes --no-type --replace-all -- fetch.all true
git config --local --no-includes --no-type --replace-all -- fetch.showforcedupdates true
git config --local --no-includes --no-type --replace-all -- fetch.writecommitgraph true
git config --local --no-includes --no-type --replace-all -- gc.auto 0
git config --local --no-includes --no-type --replace-all -- pack.compression 9
git config --local --no-includes --no-type --replace-all -- transfer.fsckobjects true
git config --local --no-includes --no-type --replace-all -- submodule.recurse false
if [ "$(git config --get --local --no-includes -- core.bare)" = true ]
then git fetch -uv --all --multiple --progress --recurse-submodules=no --show-forced-updates --write-commit-graph
else git pull -v --all --progress --recurse-submodules=no --show-forced-updates
fi' ';'
