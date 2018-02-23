create script forlder:
  file.directory:
    - name: /opt/sa_tools/scripts
    - makedirs: True
    - dir_mode: 755

push check_file_exists.py file:
  file.managed:
    - name: /opt/sa_tools/scripts/check_file_exists.py
    - source: salt://zabbix/files/opt/sa_tools/scripts/check_file_exists.py
    - mode: 755
    - user: root
    - group: root

topvdn.check.file.exists parameter:
  cmd.script:
    - source: salt://zabbix/files/topvdn.check.file.exists.sh
    - cwd: /tmp
    - only:
      - test -d /usr/local/services/zabbix/etc/zabbix_agentd.conf.d
