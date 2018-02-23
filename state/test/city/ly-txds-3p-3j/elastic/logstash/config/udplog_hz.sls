push udplog_hz.json file:
  file.managed:
    - name: /etc/logstash/udplog_hz.json
    - source: salt://city/ly-txds-3p-3j/elastic/logstash/files/udplog_hz.json.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja