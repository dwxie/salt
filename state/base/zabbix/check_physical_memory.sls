create script forlder:
  file.directory:
    - name: /backup/script
    - makedirs: True
    - dir_mode: 755

push check_physical_memory.sh file:
  file.managed:
    - name: /backup/script/check_physical_memory.sh
    - source: salt://zabbix/files/backup/script/check_physical_memory.sh
    - mode: 755
    - user: root
    - group: root

topvdn common parameter:
  file.managed:
    - name: /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.common.conf
    - source: salt://zabbix/files/zabbix_agentd.conf.d/topvdn.common.conf
    - mode: 644
    - user: topvdn
    - group: topvdn
