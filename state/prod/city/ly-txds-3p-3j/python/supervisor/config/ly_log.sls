{% set prefix = "/etc/supervisor/projects" %}
{% set name = "ly_log.conf" %}
{% set source_prefix = "salt://city/ly-txds-3p-3j/python/supervisor/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - onlf:
      - test -d {{ prefix }}
