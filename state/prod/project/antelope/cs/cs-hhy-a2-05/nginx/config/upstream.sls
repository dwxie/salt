{% set prefix = "/opt/nginx/conf" %}
{% set name = "upstream.conf" %}
{% set source_prefix = "salt://project/antelope/cs/cs-hhy-a2-05/nginx/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
    - template: jinja
