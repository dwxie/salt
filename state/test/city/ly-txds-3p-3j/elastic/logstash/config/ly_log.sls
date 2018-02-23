{%set prefix = '/tmp' %}
{%set name = 'ly_log.json' %}

push {{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: salt://city/ly-txds-3p-3j/elastic/logstash/files/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
