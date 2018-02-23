{% set prefix = "/etc/logstash" %}
{% set name = "ly_log.json" %}
{% set source_prefix = "salt://city/cs-hhy-a2-05/elastic/logstash/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - onlf:
      - test -d {{ prefix }}
