{% set prefix = "/opt/nginx/conf" %}
{% set name = "nginx.conf" %}
{% set source_prefix = "salt://project/antelope/cs/ly-txds-3p-3j/nginx/firefly/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
