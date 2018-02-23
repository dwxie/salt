#!/bin/bash
#
user_name=$1

if [ $# -ne 1 ];then
         echo "Usage: $0 user_name"
         exit 1
fi

/usr/sbin/useradd $user_name -d /home/$user_name -m

        check=`cat /etc/passwd | awk -F ':' '{print $1}' | grep $user_name`
if [ -n $check  ];then
        echo add success!
else
        echo add user failure!
fi

echo "${user_name} ALL=(root) NOPASSWD: ALL" | tee /etc/sudoers.d/${user_name}
chmod 0440 /etc/sudoers.d/${user_name}
echo 'Defaults:${user_name} !requiretty' >> /etc/sudoers.d/${user_name}

echo "change success"

