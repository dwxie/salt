sync replace_agentd.sh script file:
  file.managed:
    - name: /tmp/replace_agentd.sh
    - source: salt://zabbix/files/replace_agentd.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test ! -f /tmp/replace_agentd.sh

run replace_agentd.sh script file:
  cmd.run:
    - name: bash /tmp/replace_agentd.sh
    - cwd: /usr/local/bin
    - onlyif:
      - test -f /tmp/replace_agentd.sh

del replace_agentd.sh script file:
  file.absent:
    - name: /tmp/replace_agentd.sh
