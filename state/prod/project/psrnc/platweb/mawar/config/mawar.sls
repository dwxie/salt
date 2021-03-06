{% set prefix = "/var/www" %}
{% set name = "mawar.yaml" %}
{% set source_prefix = "salt://project/psrnc/platweb/mawar/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
