{% set prefix = "/opt/nginx/html" %}
{% set name = "crossdomain.xml" %}
{% set source_prefix = "salt://project/antelope/cs/nginx/files" %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
