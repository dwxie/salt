{% set prefix = "/opt/healthchecker" %}
{% set name = "start.sh" %}
{% set source_prefix = "salt://application/cos/healthchecker/files" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: root
    - group: root

