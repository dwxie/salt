{% set prefix = "/opt" %}
{% set name = "gen_partitions_for_cs_pillar.sh" %}
{% set source_prefix = "salt://application/cs/storage/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}

