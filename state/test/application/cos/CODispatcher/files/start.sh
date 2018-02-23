#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -SHn 100001
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

cd "${SCRIPT_PATH}"
files="$(ls etc/*.loopdispatcher.conf.yaml)"

echo "${files}" | while read file
do
    nohup ./loopdispatcher -c "${file}" > /dev/null 2>&1 &
done
#nohup ./loopdispatcher > /dev/null 2>&1 &
