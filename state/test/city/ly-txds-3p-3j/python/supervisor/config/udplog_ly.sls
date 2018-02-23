push udplog_ly.conf config:
  file.managed:
    - name: /etc/supervisor/projects/udplog_ly.conf
    - source: salt://city/ly-txds-3p-3j/python/supervisor/files/udplog_ly.conf
    - mode: 644
    - user: root
    - group: root
    - onlf:
      - test -d /etc/supervisor/projects
