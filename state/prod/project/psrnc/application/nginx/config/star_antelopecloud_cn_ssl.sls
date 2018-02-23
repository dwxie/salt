{% set prefix = "/opt/nginx/conf" %}
{% set source_prefix = "salt://project/psrnc/application/nginx/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

{% set name = "star.antelopecloud.cn.crt" %}
push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}

{% set name = "star.antelopecloud.cn.key" %}
push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
