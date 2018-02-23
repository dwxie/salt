#!/bin/bash

git_path="/usr/local/src/git/all_sls"

if [ $# -eq 1 ];then
    branch_name="$1"
else
    branch_name=""
fi

if [ $(id -u) -ne 0 ];then
    echo -e "Please use root to run"
    exit 12
fi

if [ -d "$git_path" ];then
    cd $git_path
    if [ "$branch_name" != "" ];then
        echo -e "[git checkout to $branch_name branch]"
        sleep 1
        N=$(git branch -a|egrep -v remote|egrep ${branch_name}|wc -l)
        if [ $N -eq 1 ];then
            git checkout $branch_name
        else
            git checkout -b ${branch_name} origin/${branch_name}
        fi
    else
        git checkout dev
        if [ $? -ne 0 ];then
            echo -e "Sorry.. I cant switch to dev branch.请确认是否存在dev分支"
            exit 12
        fi
    fi
    echo -e "[git pull dev branch from git_server]"
    sleep 1
    git pull
    echo -e "[rsync files to dest path]"
    sleep 1
    if [ -d "salt" ];then
        echo -e "[rsync salt/ to /etc/salt/]"
        sleep 1
        rsync -azvr ./salt/ /etc/salt/
    else
        echo -e "[salt dir not found]"
    fi
    if [ -d "pillar" ];then
        echo -e "[rsync pillar/ to /opt/topvdn/salt/pillar/]"
        sleep 1
        rsync -azvr --delete-after ./pillar/ /opt/topvdn/salt/pillar/
    else
        echo -e "[pillar dir not found]"
    fi
    if [ -d "state" ];then
        echo -e "[rsync state/ to /opt/topvdn/salt/state/]"
        sleep 1
        rsync -azvr --delete-after ./state/ /opt/topvdn/salt/state/
    else
        echo -e "[state dir not found]"
    fi

else
    echo -e "Sorry.. git 仓库的路径无法找到"
    exit 12
fi
