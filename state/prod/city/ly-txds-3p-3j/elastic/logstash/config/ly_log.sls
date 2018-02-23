push ly_log.json file:
  file.managed:
    - name: /etc/logstash/ly_log.json
    - source: salt://city/ly-txds-3p-3j/elastic/logstash/files/ly_log.json.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
