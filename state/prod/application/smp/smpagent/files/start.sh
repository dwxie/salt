#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
DAY="$(date '+%Y.%m.%d')"

ulimit -SHn 100001
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

cd "${SCRIPT_PATH}"
mkdir -p "${SCRIPT_PATH}/logs"
nohup ./smpagent-linux-amd64 -c smpagent.yaml >> "${SCRIPT_PATH}/logs/smpagent.${DAY}.log" 2>&1 &
