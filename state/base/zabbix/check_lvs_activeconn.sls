create script forlder:
  file.directory:
    - name: /opt/sa_tools/scripts
    - makedirs: True
    - dir_mode: 755

push check_lvs_activeconn.sh file:
  file.managed:
    - name: /opt/sa_tools/scripts/check_lvs_activeconn.sh
    - source: salt://zabbix/files/opt/sa_tools/scripts/check_lvs_activeconn.sh
    - mode: 755
    - user: root
    - group: root

topvdn lvs activeconn parameter:
  file.managed:
    - name: /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.lvs.activeconn.conf
    - source: salt://zabbix/files/zabbix_agentd.conf.d/topvdn.lvs.activeconn.conf
    - mode: 644
    - user: topvdn
    - group: topvdn
