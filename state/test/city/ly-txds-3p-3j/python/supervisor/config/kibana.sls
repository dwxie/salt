push kibana.conf config:
  file.managed:
    - name: /etc/supervisor/projects/kibana.conf
    - source: salt://city/ly-txds-3p-3j/python/supervisor/files/kibana.conf
    - mode: 644
    - user: root
    - group: root
    - onlf:
      - test -d /etc/supervisor/projects
