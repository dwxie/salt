{% set prefix = "/opt/nginx/html" %}
{% set name = "crossdomain.xml" %}
{% set source_prefix = "salt://project/psrnc/cs/nc-sndl/camera/nginx/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
