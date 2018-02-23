#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

cd "${SCRIPT_PATH}"
pids=$(ps -ef | grep './codisktracker' | grep -v 'grep' | awk '{print $2}')
if [ -n "${pids}" ];
then
    kill ${pids}
fi
