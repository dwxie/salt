#!/bin/bash
#
# Script for recover mysql database
#

config_file=/usr/local/services/mysql/my.cnf
datapath=`cat $config_file | grep datadir | awk -F "=" '{print $2}' | sed 's/ //g'`
redolog_dir=`cat $config_file | grep "innodb_log_group_home_dir" | awk -F "=" '{print $2}' | sed 's/ //g'`
user=topvdn
passwd=redhat
database=cyqz_db

while getopts "b:i:" opt;do
    case $opt in
        b)
            basedir=$OPTARG
            ;;
        i)
            increment_dir=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$opt"
            ;;
    esac
done

cmd_path=`which innobackupex`

if [ "$cmd_path" == '' ]
then
    apt-get -y install xtrabackup
fi

mysqld_pid=`netstat -lntp | grep mysqld | awk '{print $7}' | awk -F '/' '{print $1}'`

if [ "$mysqld_pid"  == '' ]
then
    echo "==============mysqld is not exit==================="
    exit 2
else
    if [ ! -d "$datapath" -o ! -d "$redolog_dir" ]
    then
        echo "datapath or redolog_dir is not exists"
        exit 3
    fi    
        echo "==================killed mysqld process================"
        echo 
        echo "===============IS OK TO QUIT NOW !!!==================="
        echo "=================back up other myisam database========="
        cd $datapath && pwd && tar czvf backup_data-$(date +%F).tar.gz ./* --exclude $database/ --exclude ibdata1 --exclude mysql.pid
        echo 
        cd $redolog_dir && pwd && tar czvf backup_redolog-$(date +%F).tar.gz ./*
        sleep 3
        kill $mysqld_pid
fi

$cmd_path --defaults-file=$config_file --use-memroy=4G --databases=$database --redo-only --apply-log $basedir         # 数据尚且不能用于恢复操作，因为备份的数据中可能会包含尚未提交的事务或已经提交但尚未同步至数据文件中的事务。因此，此时数据 文件仍处理不一致状态。--apply-log的作用是通过回滚未提交的事务及同步已经提交的事务至数据文件使数据文件处于一致性状态
$cmd_path --defaults-file=$config_file --use-memroy=4G --databases=$database --apply-log $basedir --incremental-dir=$increment_dir                                               # redo-only redo是指在回放日志的时候把已经COMMIT的事务重做一遍，对于没有commit的事务按照abort处理，不进行任何操作

# $cmd_path --defaults-file=$config_file --copy-back $basedir

chown -R mysql:mysql $datapath

