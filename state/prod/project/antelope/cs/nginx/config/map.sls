{% set prefix = "/opt/nginx/conf" %}
{% set name = "map.conf" %}
{% set source_prefix = "salt://project/antelope/cs/nginx/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
