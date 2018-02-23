{% set prefix = "/opt/sa_tools/scripts/py" %}
{% set script_name = "snapshot_check.py" %}

push {{ script_name }} script:
  file.managed:
    - name: {{ prefix }}/node_check.py
    - source: salt://application/relay/files/{{ script_name }}
    - mode: 755
    - user: root
    - group: root
