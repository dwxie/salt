#!/bin/bash
#
# Script for full backup mysql database
# Add by kid
# -- 2017-03-02 --

databases="cyqz"                            # databases needs to be backup and the spreater is [::space::]
socket=/usr/local/services/mysql/var/data/my.sock
backup_dir=/backup/xtrabackup/fullback      # the general full backup dir
conf=/usr/local/services/mysql/my.cnf 
user=topvdn                                 # user needs to be mysql's root
password=redhat
logfile=/var/log/xtrabackup                 # log file position
remain_num=3                                # the number of lastest part backup dir which need to be remain


inno_running_pid=`ps -ef | grep "innobackupex"  | grep -v grep | awk '{print $2}'`

if [[ "$inno_running_pid" != "" ]]
then
	echo "=============`date +%F-%H:%M:%S`==========xtraback is running...===============" >> $logfile
	exit 3
fi

if [ ! -d "$backup_dir" ] || [ ! -x $backup_dir ];then
    mkdir -p $backup_dir >/dev/null 2>&1; chmod -R 755 $backup_dir          # chmod is for rsync backup
fi

echo -e "==========`date +%F-%H:%M:%S`=========start full backup============" >>$logfile

start_timestamp=`date +%s`
/usr/bin/innobackupex --defaults-file=$conf --user=$user --password=$password --databases="$databases" --socket=$socket $backup_dir >>$logfile 2>&1 &
end_timestamp=`date +%s`

convert_time=`date -d @$end_timestamp "+%Y-%m-%-d_%H-%M-%S"`
convert_time_dir=`ls -la $backup_dir | egrep -v '(total|\.)' | awk '{ if($9=="'$convert_time'"){print $9}}'`
if [ "$convert_time_dir" != '' ]
then

        real_dir=$backup_dir/$convert_time_dir
        mysql -u $user -p$password -e "show slave status\G" | egrep -i 'Exec|Master_log_file|read' > $real_dir/master_binlog_info

else
        end_timestamp=$(( `date +%s` - 1 ))
        convert_time=`date -d @$end_timestamp "+%Y-%m-%-d_%H-%M-%S"`
        convert_time_dir=`ls -la $backup_dir | egrep -v '(total|\.)' | awk '{ if($9=="'$convert_time'"){print $9}}'`
        real_dir=$backup_dir/$convert_time_dir
        mysql -u $user -p$password -e "show slave status\G" | egrep -i 'Exec|Master_log_file|read' > $read_dir/master_binlog_info

fi

do
	pid=`ps -ef | grep "innobackupex" | grep -v grep | awk '{print $2}'`
	if [ -n "$pid" ];then
		continue
	else
		end_timestamp=`date +%s`
		total=`expr $end_timestamp - $start_timestamp`
		echo >> $logfile
		echo -e "=====================totally coste time $total sec===================" >>$logfile
        echo >> $logfile
		echo -e "==========`date +%F-%H:%M:%S`==========end full backup=============" >>$logfile
		break
	fi
done

total=`ls -la $backup_dir  | egrep -v '(total|\.)' | wc -l`     # total number of full backup dirs
if [ $total -lt 1 ];then
	echo -e 'THRER IS NO FULLBACK UP FILE !!! CHECK THE FULL BACKUP DIR !!!' >>$logfile
	exit 4
fi

array=()                                        # the array includes timestamp of all full backup dirs
if [ $total -ge $remain_num ];then 
    for (( i=1;i<=$total;i++ ));                # deal with the timestamp of the all full backup dirs
    do
	    fb_time=`ls -la $backup_dir  | egrep -v '(total|\.)' | awk '{print $NF}' | awk -F '_' '{gsub(/-/,":",$2);print $0}' | awk 'NR=='$i''`
	    fb_timestamp=`date -d "$fb_time" +%s`
        array=(${array[@]} $fb_timestamp)
    done
fi

for ((i=0;i<${#array[@]};i++))                   # sort algorithm
do
      n=i
      min=${array[$i]}
      for((j=i+1;j<${#array[@]};j++))
      do
                if [[ ${array[$j]} -lt $min ]]
                then
                        n=$j
                        min=${array[$j]}
                fi
      done
      t=${array[$n]}
      array[$n]=${array[$i]}
      array[$i]=$t
done

for ((i=0;i<${#array[@]}-"$remain_num";i++))
do
        deldir=`date -d "@${array[$i]}" "+%F_%H-%M-%S"`
      	cd $backup_dir && rm -r $deldir
done

cd $backup_dir && chmod 755 ./* -R
