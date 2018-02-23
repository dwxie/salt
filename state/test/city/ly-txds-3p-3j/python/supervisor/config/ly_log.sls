push ly_log.conf config:
  file.managed:
    - name: /etc/supervisor/projects/ly_log.conf
    - source: salt://city/ly-txds-3p-3j/python/supervisor/files/ly_log.conf
    - mode: 644
    - user: root
    - group: root
    - onlf:
      - test -d /etc/supervisor/projects
