{% set prefix = "/opt/LoopDispatcher" %}
{% set name = "loopdispatcher.conf.yaml" %}
{% set source_prefix = "salt://application/cos/LoopDispatcher/files" %}
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
