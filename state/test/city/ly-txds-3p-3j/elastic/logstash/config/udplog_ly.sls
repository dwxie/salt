push udplog_ly.json file:
  file.managed:
    - name: /etc/logstash/udplog_ly.json
    - source: salt://city/ly-txds-3p-3j/elastic/logstash/files/udplog_ly.json.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja