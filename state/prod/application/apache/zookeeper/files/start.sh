#!/bin/bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -SHn 100001
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
source /etc/profile

cd "${SCRIPT_PATH}"
nohup ./bin/zkServer.sh start > /dev/null 2>&1 &
