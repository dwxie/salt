{% set prefix = "/opt/nginx/conf" %}
{% set name = "nginx.conf" %}
{% set source_prefix = "salt://project/antelope/cs/bj/appweb/nginx-gridfs/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
