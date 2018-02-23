#!/bin/bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

cd "${SCRIPT_PATH}"
/usr/bin/rsync -av --exclude-from="clips_exclude.list" /ceph/web/ /clips_backup/ > /tmp/rsync_clips_backup.log 2>&1
