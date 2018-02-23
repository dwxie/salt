{% set prefix = "/usr/local/services/nginx/conf" %}
{% set source_prefix = "salt://city/ly-txds-3p-3j/ly-txds-3p-3j-logstash3/nginx/files" %}

{% set name = "elasticsearch_pass_file" %}
push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root

{% set name = "kibana_pass_file" %}
push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
