#!/bin/bash
#
# script for partial backup databases
# Added by kid
# -- 2017-03-02 --

databases="cyqz"										# databases needs to be backup and the spreater is [::space::]
socket=/usr/local/services/mysql/var/data/mysql.sock
backup_dir=/backup/xtrabackup/fullback              	# the general full backup dir 
partback_dir=/backup/xtrabackup/partback				# the general part backup dir 
conf=/usr/local/services/mysql/my.cnf            
user=topvdn												# user needs to be mysql's root
password=redhat							
logfile=/var/log/xtrabackup							    # log file position
remain_num=3											# the number of lastest part backup dir which need to be remain 

inno_running_pid=`ps -ef | grep "innobackupex"  | grep -v grep | awk '{print $2}'`

if [[ "$inno_running_pid" != "" ]]
then
	echo "=============`date +%F-%H:%M:%S`==========xtraback is running...===============" >> $logfile
	exit 3
fi

start_backup(){
    
    if [ ! -e $backup_dir ];then
        mkdir -p $backup_dir >/dev/null 2>&1; chmod -R 755 $backup_dir
    fi
    if [ ! -e $partback_dir ];then
        mkdir -p $partback_dir >/dev/null 2>&1; chmod -R 755 $partback_dir      # chmod 755 is for rsync backup
    fi

	total=`ls -la $backup_dir  | egrep -v '(total|\.)' | wc -l`     # total number of fullback dir
	if [ $total -lt 1 ];then
		echo -e 'THRER IS NO FULLBACK UP FILE !!! CHECK THE FULL BACKUP DIR !!!' >>$logfile
		exit 4
	fi
	
	Maxtime=0
	for (( i=1;i<=$total;i++ ));    # deal with the timestamp
	do
		fb_time=`ls -la $backup_dir  | egrep -v '(total|\.)' | awk '{print $NF}' | awk -F '_' '{gsub(/-/,":",$2);print $0}' | awk 'NR=='$i''`
		fb_timestamp=`date -d "$fb_time" +%s`
		if [ $Maxtime -lt $fb_timestamp ];then
			Maxtime=$fb_timestamp
			fb_dir=`echo $fb_time | awk '{gsub(/:/,"-",$2);print $0}' | awk '{gsub(/ /,"_",$0);print $0}'`                  # the relative path of specified full backup dir
			continue
		else
			break
		fi
	done

	fullback_dir=$backup_dir/$fb_dir            # the absolute path of specified full backup dir
    
    start_timestamp=`date +%s`
    echo -e "==========`date +%F-%H:%M:%S`=========start part backup============" >>$logfile
	/usr/bin/innobackupex --defaults-file=$conf --user=$user --password=$password --databases="$databases" --socket=$socket --incremental $partback_dir --incremental-basedir $fullback_dir >>$logfile 2>&1 &

	end_timestamp=`date +%s`
	convert_time=`date -d @$end_timestamp "+%Y-%m-%-d_%H-%M-%S"`
	convert_time_dir=`ls -la $backup_dir | egrep -v '(total|\.)' | awk '{ if($9=="'$convert_time'"){print $9}}'`
	if [ "$convert_time_dir" != '' ]
	then
        real_dir=$backup_dir/$convert_time_dir
        mysql -u $user -p$password -e "show slave status\G" | egrep -i 'Exec|Master_log_file|read' > $real_dir/master_binlog_info_file
	else
        end_timestamp=$(( `date +%s` - 1 ))
        convert_time=`date -d @$end_timestamp "+%Y-%m-%-d_%H-%M-%S"`
        convert_time_dir=`ls -la $backup_dir | egrep -v '(total|\.)' | awk '{ if($9=="'$convert_time'"){print $9}}'`
        real_dir=$backup_dir/$convert_time_dir
        mysql -u $user -p$password -e "show slave status\G" | egrep -i 'Exec|Master_log_file|read' > $read_dir/master_binlog_info_file
	fi

while [ 1 ]                      				# deal with end tags of the logfile
do
	pid=`ps -ef | grep "innobackupex" | grep -v grep | awk '{print $2}'`
	if [ -n "$pid" ];then
		continue
	else
		end_timestamp=`date +%s`
		D_num=`expr $end_timestamp - $start_timestamp`
		echo >> $logfile
		echo -e "=====================totally coste time $D_num sec===================" >>$logfile
		echo >> $logfile
		echo -e "==========`date +%F-%H:%M:%S`==========end part backup=============" >>$logfile
		break
	fi
done
    chmod 700 $logfile
}

remove_olddir(){

    total=`ls -la $partback_dir  | egrep -v '(total|\.)' | wc -l`     # total number of all part backup dir
    if [ $total -lt 1 ];then
    	echo -e 'THRER IS NO FULLBACK UP FILE !!! CHECK THE FULL BACKUP DIR !!!' >>$logfile
    	exit 4
    fi
    
    array=()
    if [ $total -ge $remain_num ]
    then 
    	for (( i=1;i<=$total;i++ ));    # deal with the timestamp
    	do
    		pb_time=`ls -la $partback_dir  | egrep -v '(total|\.)' | awk '{print $NF}' | awk -F '_' '{gsub(/-/,":",$2);print $0}' | awk 'NR=='$i''`
    		pb_timestamp=`date -d "$pb_time" +%s`
            array=(${array[@]} $pb_timestamp)
        done
    fi

    for((i=0;i<${#array[@]};i++))		# sort algorithm
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
    for((i=0;i<${#array[@]}-"$remain_num";i++))
    do
        deldir=`date -d "@${array[$i]}" "+%F_%H-%M-%S"`
      	cd $partback_dir && rm -r $deldir
    done
    cd  $partback_dir && chmod 755 ./* -R
}
start_backup
remove_olddir
