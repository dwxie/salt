{% set prefix = "/opt/sa_tools/scripts/py" %}
{% set name = "clean_event_info.py" %}
{% set source_prefix = "salt://application/cs/zone/index_web/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
