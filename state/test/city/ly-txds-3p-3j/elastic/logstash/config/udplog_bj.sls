push udplog_bj.json file:
  file.managed:
    - name: /etc/logstash/udplog_bj.json
    - source: salt://city/ly-txds-3p-3j/elastic/logstash/files/udplog_bj.json.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja