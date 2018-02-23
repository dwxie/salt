{% set prefix = "/var/www" %}
{% set name = "goindexweb.yaml" %}
{% set source_prefix = "salt://application/cs/zone/goindexweb/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
