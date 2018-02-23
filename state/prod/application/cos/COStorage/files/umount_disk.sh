#!/bin/bash

role="${1-None}"
start="${2:-1}"
end="${3:-12}"
step="${4:-1}"

test "${role}" == "None" && echo "Please type <storage|costorage> to do umount action!" && exit 2

case "${role}" in
    storage)
        for i in $(seq ${start} ${step} ${end})
        do
            umount /disk/${i}/data
            umount /disk/${i}/index
            umount /disk/${i}/index_backup
        done
    ;;
    costorage)
        for i in $(seq ${start} ${step} ${end})
        do
            umount /codisk/${i}/data
            umount /codisk/${i}/index
            umount /codisk/${i}/index_backup
        done
    ;;
esac
