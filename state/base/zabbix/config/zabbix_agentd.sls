push zabbix_agentd.conf file:
  file.managed:
    - name: /usr/local/services/zabbix/etc/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf.jinja
    - mode: 644
    - user: topvdn
    - group: topvdn
    - template: jinja
    - onlyif:
      - test -f /usr/local/services/zabbix/etc/zabbix_agentd.conf
