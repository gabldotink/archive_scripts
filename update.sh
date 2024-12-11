#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(realpath "$(dirname "$0")")"
export d
g(){ if [ -d "$d/$2" ]
then cd "$d/$2"
git pull -v --progress --recurse-submodules=no --show-forced-updates
else git clone -lvoorigin --no-hardlinks -- "$d/../git/$1/$2/.git" "$d/$2"
fi
cd "$d"
}
export g
g github.com/Brainicism bgutil-ytdlp-pot-provider
g github.com/markfasheh duperemove
g github.com/mikf gallery-dl
g github.com/jjjake internetarchive
g github.com/yt-dlp yt-dlp
g github.com/coletdjnz yt-dlp-get-pot
g github.com/pukkandan yt-dlp-ReturnYoutubeDislike
find . -type d -name .git -execdir sh -xc 'git pull
git gc --aggressive --no-cruft --prune=all' ';'
rm -fr "$d/yt-dlp/yt-dlp-plugins"
mkdir -p "$d/yt-dlp/yt-dlp-plugins/bgutil-ytdlp-pot-provider" "$d/yt-dlp/yt-dlp-plugins/yt-dlp-get-pot" "$d/yt-dlp/yt-dlp-plugins/yt-dlp-ReturnYoutubeDislike"
cp -Rp "$d/bgutil-ytdlp-pot-provider/plugin/yt_dlp_plugins" "$d/yt-dlp/yt-dlp-plugins/bgutil-ytdlp-pot-provider"
cp -Rp "$d/yt-dlp-get-pot/yt_dlp_plugins" "$d/yt-dlp/yt-dlp-plugins/yt-dlp-get-pot"
cp -Rp "$d/yt-dlp-ReturnYoutubeDislike/yt_dlp_plugins" "$d/yt-dlp/yt-dlp-plugins/yt-dlp-ReturnYoutubeDislike"
