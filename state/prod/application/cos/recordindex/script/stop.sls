{% set prefix = "/opt/recordindex" %}
{% set name = "stop.sh" %}
{% set source_prefix = "salt://application/cos/recordindex/files" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: root
    - group: root

