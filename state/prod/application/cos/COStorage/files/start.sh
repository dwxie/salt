#!/bin/bash

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

ulimit -SHn 100001

cd /opt/COStorage
sleep 30s

chmod 755 COStorage
./COStorage > /dev/null 2>&1 &
