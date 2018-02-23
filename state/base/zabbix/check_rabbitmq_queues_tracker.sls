create script forlder:
  file.directory:
    - name: /opt/sa_tools/scripts
    - makedirs: True
    - dir_mode: 755

push check_rabbitmq_queues_tracker.sh file:
  file.managed:
    - name: /opt/sa_tools/scripts/check_rabbitmq_queues_tracker.sh
    - source: salt://zabbix/files/opt/sa_tools/scripts/check_rabbitmq_queues_tracker.sh
    - mode: 755
    - user: root
    - group: root

topvdn common parameter:
  file.managed:
    - name: /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.rabbitmq.queues.tracker.conf
    - source: salt://zabbix/files/zabbix_agentd.conf.d/topvdn.rabbitmq.queues.tracker.conf
    - mode: 644
    - user: topvdn
    - group: topvdn
