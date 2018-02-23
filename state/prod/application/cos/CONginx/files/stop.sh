#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

cd "${SCRIPT_PATH}"
pids=$(ps -ef | grep './CONginx' | grep -v 'grep' | grep -v 'stop.sh' | awk '{print $2}')
if [ -n "${pids}" ];
then
    kill ${pids}
fi
