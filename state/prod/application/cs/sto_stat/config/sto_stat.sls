push storagestat.env file:
  file.managed:
    - name: /tmp/storagestat.env
    - source: salt://application/cs/sto_stat/files/sto_stat.env.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
