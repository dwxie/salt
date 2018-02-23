kill zabbix_agentd:
  cmd.run:
    - name: killall zabbix_agentd >/dev/null 2>&1 && exit 0 || exit 0

run zabbix agentd:
  cmd.run:
    - name: /usr/local/services/zabbix/sbin/zabbix_agentd -c /usr/local/services/zabbix/etc/zabbix_agentd.conf >/dev/null 2>&1 &
    - cwd: /usr/local/bin
    - onlyif:
      - test -x /usr/local/services/zabbix/sbin/zabbix_agentd

check zabbix_agentd is running:
  cmd.run:
    - name: sleep 5 && ps -e faux|egrep zabbix_agentd|egrep -v grep
