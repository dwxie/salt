#!/bin/bash
# define mysql variable

mysql_user="topvdn"
mysql_pass=""
slave_log="/var/log/slaveinfo"
database="cyqz"
socket=""

check_slave_status(){
    mysql_status=`netstat -nl | awk 'NR>2{if ($4 ~ /.*:3306/) {print "Yes";exit 0}}'`
    if [ "$mysql_status" == "Yes" ];then
            slave_status=`/usr/local/bin/mysql -u${mysql_user} -p${mysql_pass} --socket=$socket -e"show slave status\G" | grep "Running" | awk '{if ($2 != "Yes") {print "No";exit 1}}'`
            if [[ "$slave_status" =~ "No" ]];then
                    echo -e "========== slave is not working! ===============`date +%F-%H:%M:%S`=================" >> $slave_log
                    echo >> $slave_log
		            echo "=================================== stop slave !!!=====================================" >> $slave_log
                    /usr/local/bin/mysql -u${mysql_user} -p${mysql_pass} --socket=$socket -e"stop slave;"
            else
                    echo -e "========== slave is now running! ===============`date +%F-%H:%M:%S`=================" >> $slave_log
            fi
    else
	echo "mysql is down!!!" >> $slave_log
    fi
}

check_slave_status

