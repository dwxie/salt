{% set prefix = "/backup/script" %}
{% set script_name = "get_connections.py" %}

push {{ script_name }} script:
  file.managed:
    - name: {{ prefix }}/{{ script_name }}
    - source: salt://tmp/{{ script_name }}
    - mode: 755
    - user: root
    - group: root