#!/bin/bash
# Author  : chinatree <chinatree2012@gmail.com>
# Date    : 2018-01-04

# [global]
SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"

PATH="${HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH

es_data_prefix="/es_data"
es_backup_prefix="/es_backup"
es_backup_month="$(date -d '19 day ago' '+%Y%m')"
es_backup_day="$(date -d '19 day ago' '+%Y%m%d')"
es_calc_month="$(date -d '6 day ago' '+%Y%m')"
es_calc_day="$(date -d '6 day ago' '+%d')"
es_delete_data_day="$(date -d '50 day ago' '+%Y%m%d')"
es_delete_backup_day="$(date -d '8 day ago' '+%Y%m%d')"

calc_md5()
{
    if [ x"${es_calc_day}" == x"01" ];
    then
        cd "${es_data_prefix}/${es_calc_month}"
        #nohup md5sum *.tar.gz > md5.log 2>&1 &
    fi
}

compress()
{
    mkdir -p "${es_data_prefix}/${es_backup_month}"

    cd "${es_backup_prefix}"
    if [ ! -f "${es_data_prefix}/${es_backup_month}/${es_backup_day}.tar.gz" ];
    then
        tar cjpf "${es_data_prefix}/${es_backup_month}/${es_backup_day}.tar.gz" "${es_backup_day}"
    else
        echo "The file ${es_data_prefix}/${es_backup_month}/${es_backup_day}.tar.gz is exists, please check it and try again!"
    fi
}

delete()
{
    test -d "${es_backup_prefix}/${es_delete_backup_day}" && rm -rf "${es_backup_prefix}/${es_delete_backup_day}"

}

cd "${SCRIPT_PATH}"
compress
#delete
calc_md5
