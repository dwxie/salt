{% set prefix = "/opt/CONginx/conf" %}
{% set name = "nginx.conf" %}
{% set source_prefix = "salt://application/cos/CONginx/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
