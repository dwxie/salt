boot startup zabbix agentd:
  cmd.script:
    - source: salt://zabbix/files/boot_startup_zabbix_agentd.sh
    - cwd: /tmp
