push slave_change script:
  file.managed:
    - name: /opt/sa_tools/scripts/sh/check_slave_status_and_do_changes.sh
    - source: salt://tmp/check_slave_status_and_do_changes.sh
    - mode: 700
    - user: root
    - group: root
