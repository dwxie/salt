{% set prefix = "/etc/supervisor/projects" %}
{% set name = "kibana.conf" %}
{% set source_prefix = "salt://city/cs-hhy-a2-05/python/supervisor/files" %}
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
