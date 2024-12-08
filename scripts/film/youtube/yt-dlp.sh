#!/bin/sh
set -x
export POSIXLY_CORRECT
d="$(dirname "$0")"
export d
if "$d/../../software/installed/yt-dlp/yt-dlp.sh" --ignore-config '--use-extractors=[Yy]outube.*,getpot.*' "--extractor-args=youtube:player_client=all;getpot_bgutil_script=$d/../../software/installed/bgutil-ytdlp-pot-provider/server/build/generate_once.js" -Oformat_id -sfbestaudio -- "$1"|grep -Fqe-
then pre_format="$("$d/../../software/installed/yt-dlp/yt-dlp.sh" --ignore-config '--use-extractors=[Yy]outube.*,getpot.*' "--extractor-args=youtube:player_client=all;getpot_bgutil_script=$d/../../software/installed/bgutil-ytdlp-pot-provider/server/build/generate_once.js" -Oformat_id -sfbestaudio -- "$1")"
export pre_format
format="${pre_format%-*}"
export format
pre_count="$("$d/../../software/installed/yt-dlp/yt-dlp.sh" --ignore-config '--use-extractors=[Yy]outube.*,getpot.*' "--extractor-args=youtube:player_client=all;getpot_bgutil_script=$d/../../software/installed/bgutil-ytdlp-pot-provider/server/build/generate_once.js" -Fs -- "$1"|grep "-Fce$format-")"
export pre_count
count="$((pre_count-3))"
export count
printf +
pre_formats="$(for i in $(seq 0 "$((count))")
do printf '%s+' "$format-$i"
done)"
export pre_formats
formats="${pre_formats%+}"
export formats
extra_formats="+$formats"
export extra_formats
fi
if ! "$d/../../software/installed/yt-dlp/yt-dlp.sh" --ignore-config "--config-locations=$d/yt-dlp.conf" "--cache-dir=$d/yt-dlp_cache" "--download-archive=$d/yt-dlp_download-archive.txt" "--extractor-args=youtube:player_client=all;getpot_bgutil_script=$d/../../software/installed/bgutil-ytdlp-pot-provider/server/build/generate_once.js" -f"bestvideo*+bestaudio$extra_formats/best" "-o$d/videos/%(channel)s [%(channel_id)s]/[%(upload_date)s] %(title)s [%(id)s]/%(title)s.%(ext)s" $2 $3 $4 $5 $6 $7 $8 $9 -- "$1"
then rm -fir "$d/videos/$("$d/../../software/installed/yt-dlp/yt-dlp.sh" --ignore-config '--use-extractors=[Yy]outube.*,getpot.*' "--extractor-args=youtube:player_client=all;getpot_bgutil_script=$d/../../software/installed/bgutil-ytdlp-pot-provider/server/build/generate_once.js" '-sO%(channel)s [%(channel_id)s]/[%(upload_date)s] %(title)s [%(id)s]' -- "$1")"
exit 1
fi
exit 0
