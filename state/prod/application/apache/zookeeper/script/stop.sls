{% set prefix = "/opt/zookeeper" %}
{% set name = "stop.sh" %}
{% set source_prefix = "salt://application/apache/zookeeper/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
