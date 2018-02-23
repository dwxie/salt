#!/bin/bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -SHn 100001
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

cd "${SCRIPT_PATH}"
pids=$(ps -ef | grep 'kafka' | grep -v 'grep' | awk '{print $2}')
if [ -n "${pids}" ];
then
    bash ${SCRIPT_PATH}/bin/kafka-server-stop.sh
fi
