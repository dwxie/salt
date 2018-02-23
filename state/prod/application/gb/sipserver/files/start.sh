#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -SHn 100001
ulimit -c unlimited
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

cd "${SCRIPT_PATH}"
nohup ./sipserver -c sipserver.json > ./sipserver.log 2>&1 &
