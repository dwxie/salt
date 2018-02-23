#!/usr/bin/env bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -c unlimited
ulimit -SHn 100001
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

cd "${SCRIPT_PATH}"
./CONginx -p ../
