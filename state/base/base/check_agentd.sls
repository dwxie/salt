create sa_tools if not exists:
  file.directory:
    - name: /opt/sa_tools/scripts/sh
    - makedirs: True
    - dir_mode: 777

copy check_agentd.sh script to remote:
  file.managed:
    - name: /opt/sa_tools/scripts/sh/check_agentd.sh
    - source: salt://base/files/check_agentd.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test -d /opt/sa_tools/scripts/sh

add add_check_agentd crontab task to crontab:
  cmd.script:
    - source: salt://base/files/add_check_agentd.sh
