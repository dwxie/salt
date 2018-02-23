#!/bin/bash

PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
SCRIPT_NAME="$(basename "$0")"
PARA_NUM="$#"
PROC_PID="$$"

SVN_USER="topvdn"
SVN_PASS="N5eFtv5d53dWWmdg5XTx"
SVN_URL="svn://11111/ops_saltstack/pillar"
SVN_DST="${SCRIPT_PATH}/pillar"

RSYNC_BIN="/usr/bin/rsync"
RSYNC_DST="/opt/topvdn/salt/pillar"

checkout() {
    svn checkout --username "${SVN_USER}" --password "${SVN_PASS}" "${SVN_URL}" "${SVN_DST}"
}

rsync() {
    ${RSYNC_BIN} -a --delete-after --exclude=".svn" "${SVN_DST}/" "${RSYNC_DST}/"
}

checkout
rsync
