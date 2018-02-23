{% set prefix = "/opt/automaticTool" %}
{% set name = "automaticTool.conf.yaml" %}
{% set source_prefix = "salt://application/cos/automaticTool/files" %}
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
