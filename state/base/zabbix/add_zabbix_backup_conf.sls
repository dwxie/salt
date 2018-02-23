create /opt/sa_tools/scripts/sh folder if not exists:
  cmd.run:
    - name: mkdir -p /opt/sa_tools/scripts/sh
    - onlyif: test ! -d /opt/sa_tools/scripts/sh

push backup zabbix conf script file:
  file.managed:
    - name: /opt/sa_tools/scripts/sh/backup_zabbix_conf.sh
    - source: salt://zabbix/files/backup_zabbix_conf.sh
    - mode: 755
    - user: root
    - group: root

add backup zabbix conf script to crontab:
  cmd.script:
    - source: salt://zabbix/files/add_crontab_for_backup_zabbix_conf.sh
    - cwd: /tmp

