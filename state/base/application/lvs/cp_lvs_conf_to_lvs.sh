#!/bin/bash

salt-cp "bj-lvs1" ./bj/bj_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "bj-lvs2" ./bj/bj_lvs2.conf /tmp/keepalived.conf.from_git

salt-cp "cs-hhy-a2-05-lvs1" ./cs/cs_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "cs-hhy-a2-05-lvs2" ./cs/cs_lvs2.conf /tmp/keepalived.conf.from_git

salt-cp "fs-lvs1" ./fs/fs_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "fs-lvs2" ./fs/fs_lvs2.conf /tmp/keepalived.conf.from_git

salt-cp "tz-lvs1" ./tz/tz_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "tz-lvs2" ./tz/tz_lvs2.conf /tmp/keepalived.conf.from_git

salt-cp "sjz-lvs1" ./sjz/sjz_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "sjz-lvs2" ./sjz/sjz_lvs2.conf /tmp/keepalived.conf.from_git

salt-cp "ly-txds-3p-3j-lvs1" ./ly/ly_lvs1.conf /tmp/keepalived.conf.from_git
salt-cp "ly-txds-3p-3j-lvs2" ./ly/ly_lvs2.conf /tmp/keepalived.conf.from_git

