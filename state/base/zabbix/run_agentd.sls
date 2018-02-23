run zabbix agentd:
  cmd.run:
    - name: /usr/local/bin/zabbix_agentd
    - cwd: /usr/local/bin
    - onlyif:
      - test -x /usr/local/bin/zabbix_agentd
