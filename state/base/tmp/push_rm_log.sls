# push rm indexserver log script state

push process_bond_info.py script:
  file.managed:
    - name: /opt/sa_tools/scripts/py/cron_rm_log.py
    - source: salt://tmp/cron_rm_log.py
    - mode: 755
    - user: root
    - group: root
