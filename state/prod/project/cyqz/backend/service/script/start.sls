{% set prefix = "/opt/web-service-3.0" %}
{% set name = "start.sh" %}
{% set source_prefix = "salt://project/cyqz/backend/service/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: root
    - group: root
