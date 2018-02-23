#!/bin/bash

tmp_name="`date +%F_%T`"
tmp_file_name="/tmp/crontab.${tmp_name}"
cp -a /etc/crontab ${tmp_file_name}
echo -e "" >>  $tmp_file_name
N=$(cat $tmp_file_name|egrep "check agentd"|wc -l)
if [ $N -ge 1 ];then
    echo -e "Already added check agentd to crontab"
else
    echo -e "#check agentd auto start if down" >> $tmp_file_name
    echo -e "* * * * * root bash /opt/sa_tools/scripts/sh/check_agentd.sh >/dev/null 2>&1 &" >> $tmp_file_name
    echo -e "" >> $tmp_file_name
fi
if [ $? -eq 0 ];then
    echo -e "Added check agentd successfully"
else
    echo -e "Added check agentd Failed"
    exit 12
fi

cp $tmp_file_name /etc/crontab
echo -e "-------------------------------------"
cat /etc/crontab
rm $tmp_file_name
