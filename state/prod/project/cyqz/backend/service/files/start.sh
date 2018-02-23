#!/usr/bin/env bash

# Set Java Environment Variable
export JAVA_HOME="/usr/local/services/jdk"
export PATH=$JAVA_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

cd "${SCRIPT_PATH}"
nohup java -server -jar -DCYQZ_SECRET_KEY=NetPosa!Cyqzapp!2017!@#! -DCYQZ_SECRET_IV=NetPosa! web-service-3.0.jar > /dev/null 2>&1 &
