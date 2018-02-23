#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

cd "${SCRIPT_PATH}"
pids=$(ps -ef | grep java | grep web-api-3.0.jar | awk '{print $2}')
if [ -n "${pids}" ];
then
    kill -9 ${pids}
fi
