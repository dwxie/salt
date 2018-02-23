{% set prefix = "/etc/nginx" %}
{% set name = "upstream.conf" %}
{% set source_prefix = "salt://project/cyqz/edge/nginx/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
