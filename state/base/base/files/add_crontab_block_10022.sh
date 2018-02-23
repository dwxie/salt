#!/bin/bash

tmp_name="`date +%F_%T`"
tmp_file_name="/tmp/crontab.${tmp_name}"
cp -a /etc/crontab ${tmp_file_name}
echo -e "" >>  $tmp_file_name
N=$(cat $tmp_file_name|egrep "block 10022"|wc -l)
if [ $N -ge 1 ];then
    echo -e "Already added block 10022 to crontab"
else
    echo -e "#block 10022 except jump server to ssh login" >> $tmp_file_name
    echo -e "*/5 * * * * root bash /opt/sa_tools/scripts/sh/make_sure_only_jump_can_login.sh >/dev/null 2>&1 &" >> $tmp_file_name
    echo -e "" >> $tmp_file_name
fi
if [ $? -eq 0 ];then
    echo -e "Added block 10022 successfully"
else
    echo -e "Added block 10022 Failed"
    exit 12
fi

cp $tmp_file_name /etc/crontab
echo -e "-------------------------------------"
cat /etc/crontab
rm $tmp_file_name
