#!/bin/bash

storage_path="/opt/storage"

start() {
    local proc_num="${1:-6}"
    cd "${storage_path}"
    echo -n "Start CStorage ... "
    ./CStorage > /dev/null 2>&1 &

    sleep 1
    if [ $(status) == ${proc_num} ];
    then
        echo '[OK]'
        return 0
    else
        echo '[FAILED]'
        return 2
    fi
}

stop() {
    local times="${1:-1}"

    # Stop CStorage
    cd "${storage_path}"
    if [ "${times}" -eq 1 ];
    then
        echo -n "Stop CStorage ... "
    fi
    killall CStorage

    sleep 1
    if [ $(status) == 0 ];
    then
        echo '[OK]'
        return 0
    else
        if [ "${times}" -le 2 ];
        then
            times=$((${times} + 1))
            stop "${times}"
        else
            echo '[FAILED]'
            return 2
        fi
    fi
}

status() {
    local proc_num

    proc_num="$(ps -eH | grep CStorage | grep -v grep | wc -l)"
    echo "${proc_num}"
}

status_detail() {
    local procs

    procs="$(ps -eH | grep CStorage | grep -v grep)"
    echo "${procs}"
}

proc_num="${2:-6}"
case "${1}" in
    start)
        start "${proc_num}"
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    status_detail)
        status_detail
        ;;
    *)
        exit 255
        ;;
esac
