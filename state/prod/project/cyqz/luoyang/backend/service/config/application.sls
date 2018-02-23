{% set prefix = "/opt/web-service-3.0/config" %}
{% set name = "application.yml" %}
{% set source_prefix = "salt://project/cyqz/luoyang/backend/files" %}

{% set extrn_data = salt['pillar.get']('cyqz:backend:web_service:application') -%}
push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      extrn_data: {{ extrn_data }}
