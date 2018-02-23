#!/bin/bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
SCRIPT_NAME="$(basename "$0")"

download_dir="/es_data"
month=$(date -d '89 day ago' '+%Y%m')
day=$(date -d '89 day ago' '+%Y%m%d')

download() {
    local month="$1"
    local day="$2"
    cd "${download_dir}"
    #wget -c -q -O "${day}.tar.gz" 'http://42.51.12.139/'"${month}"'/'"${day}"'.tar.gz' > /dev/null 2>&1 &
    axel -n 15 -q 'http://42.51.12.139/'"${month}"'/'"${day}"'.tar.gz' > /dev/null 2>&1 &
}

md5() {
    local day="$1"
    cd "${download_dir}"
    echo $(md5sum "${day}.tar.gz") >> "${SCRIPT_PATH}/md5.log" 2>&1 &
}

cd "${SCRIPT_PATH}"
case "${1}" in
    download)
        download "${month}" "${day}"
        ;;
    md5)
        md5 "${day}"
        ;;
    *)
        download "${month}" "${day}"
        ;;
esac

