{% set prefix = "/opt/nginx/conf" %}
{% set name = "log_format.conf" %}
{% set source_prefix = "salt://project/antelope/stat/nginx/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
