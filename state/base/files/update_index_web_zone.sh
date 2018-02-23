#!/bin/bash

if [ $# -ne 2 ];then
    echo -e "Usage:\n\t$0 \"path_to_index_web\" \"[cs/fs/sjz/tz]\""
    exit 12
else
    center_src_path="$1"
    zone="$2"
    if [ "$zone" == "cs" ];then
        g_list_zone="g_cs_web"
    elif [ "$zone" == "sjz" ];then
        g_list_zone="g_sjz_web"
    elif [ "$zone" == "tz" ];then
        g_list_zone="g_tz_web"
    elif [ "$zone" == "fs" ];then
        g_list_zone="g_fs_web"
    else
        echo -e "sorry.."
        echo -e "Usage:\n\t$0 \"path_to_index_web\" \"[cs/fs/sjz/tz]\""
        exit 12
    fi
fi

echo -e "This script is only used to update index_web not for first init install index_web"
read -p  "Sure you know ? [y/n]: " co8
if [ "$co8" == "yes" -o "$co8" == "" -o "$co8" == "y" ];then
    echo -e  "OK..I understand your choice and continue.."
else
    echo -e "Oh year..EXIT now.."
    exit 2
fi

the_time=$(date +%F_%H:%M)

read -p "Ready to go ? [y/n]: " co77
if [ "$co77" == "yes" -o "$co77" == "" -o "$co77" == "y" ];then
    echo -e  "OK..Let's go"
else
    echo -e "Oh year..EXIT now.."
    exit 2
fi

echo -e "OK.. 我先来备份相关文件"
sleep 1
echo -e "创建备份目录/backup/index_web/$the_time"
salt -N "$g_list_zone" cmd.run "mkdir -p /backup/index_web/$the_time"
salt -N "$g_list_zone" cmd.run "du -sh /var/www/ |column -t"

echo
echo -e "cp -a /var/www --> /backup/index_web/$the_time/"
read -p "Need this step? [y/n]: " co10
if [ "$co10" == "yes" -o "$co10" == "" -o "$co10" == "y" ];then
    salt -N "$g_list_zone" cmd.run "cp -a /var/www /backup/index_web/$the_time/"
    echo -e "[ cp -a /var/www --> /backup/index_web/$the_time/ done ]"
else
    echo -e "Skip this step. and We Continue..------"
fi

echo
echo -e "cp -a /etc/supervisor --> /backup/index_web/$the_time/"
read -p "Need this step? [y/n]: " co11
if [ "$co11" == "yes" -o "$co11" == "" -o "$co11" == "y" ];then
    salt -N "$g_list_zone" cmd.run "cp -a /etc/supervisor /backup/index_web/$the_time/"
    echo -e "[ cp -a /etc/supervisor --> /backup/index_web/$the_time/ done ]"
else
    echo -e "Skip this step. and We Continue..------"
fi
echo -e "备份完成了。现在开始更新了"
sleep 1

if [ ! -f "./list_web2" ];then
    echo -e "Sorry. list_web2 not found"
    exit 13
fi

for i in `cat ./list_web2`
do
    echo -e "【 I am dealling with server [$i] 】"
    read -p "Let's GO? [y/n]: " co0
    if [ "$co0" == "yes" -o "$co0" == "" -o "$co0" == "y" ];then
        echo -e "---- OK GO ----"
        sleep 1

        echo
        echo -e "cp -a /tmp/index_web.env --->  /var/www/index_web.env"
        read -p "Need this step? [y/n]: " co1
        if [ "$co1" == "yes" -o "$co1" == "" -o "$co1" == "y" ];then
            salt "$i" cmd.run "cp -a /tmp/index_web.env /var/www/index_web.env"
            echo -e "[ cp -a /tmp/index_web.env --> /var/www/index_web.env done ]"
        else
            echo -e "Skip this step. and We Continue..------"
        fi

        echo
        echo -e "cd $center_src_path && make update"
        read -p "Need this step? [y/n]: " co4
        if [ "$co4" == "yes" -o "$co4" == "" -o "$co4" == "y" ];then
            salt "$i" cmd.run "cd $center_src_path && make update"
            echo -e "[ cd $center_src_path && make update done ]"
        else
            echo -e "Skip this step..And We Continue..------"
        fi

        echo
        echo -e "delete /tmp/index_web.env"
        read -p "Need this step? [y/n]: " co2
        if [ "$co2" == "yes" -o "$co2" == "" -o "$co2" == "y" ];then
            salt "$i" cmd.run "rm /tmp/index_web.env"
            echo -e "[ delete /tmp/index_web.env done ]"
        else
            echo -e "Skip this step. and We Continue..------"
        fi

        echo
        echo -e "Do I need to delete this dir [$center_src_path] for you ? [y/n]: "
        read -p "Need this step? [y/n]: " co3
        if [ "$co3" == "yes" -o "$co3" == "" -o "$co3" == "y" ];then
            salt "$i" cmd.run "rm -rf $center_src_path"
            echo -e "[ rm -rf ${center_src_path} done ]"
        else
            echo -e "Skip this step. and We Continue.. ------"
        fi

        echo
        echo -e "supervisorctl -c /etc/supervisor/supervisord.conf restart index-web"
        read -p "Need this step? [y/n]: " co3
        if [ "$co3" == "yes" -o "$co3" == "" -o "$co3" == "y" ];then
            salt "$i" cmd.run "supervisorctl -c /etc/supervisor/supervisord.conf restart index-web"
            echo -e "[ supervisorctl -c /etc/supervisor/supervisord.conf restart index-web  done ]"
        else
            echo -e "Skip this step. and We Continue.. ------"
        fi

        echo
        echo -e "supervisorctl -c /etc/supervisor/supervisord.conf status"
        read -p "Need this step? [y/n]: " co31
        if [ "$co31" == "yes" -o "$co31" == "" -o "$co31" == "y" ];then
            salt "$i" cmd.run "supervisorctl -c /etc/supervisor/supervisord.conf status"
            echo -e "[ supervisorctl -c /etc/supervisor/supervisord.conf status  done ]"
        else
            echo -e "Skip this step. and We Continue.. ------"
        fi
    else
        echo -e "--- Continue to Next One ---"
        sleep 1
    fi
done

