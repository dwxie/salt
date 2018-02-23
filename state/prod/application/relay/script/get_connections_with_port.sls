{% set prefix = "/opt/sa_tools/scripts/py" %}
{% set script_name = "get_connections_with_port.py" %}

push {{ script_name }} script:
  file.managed:
    - name: {{ prefix }}/{{ script_name }}
    - source: salt://application/relay/files/{{ script_name }}
    - mode: 755
    - user: root
    - group: root
