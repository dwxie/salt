{% set prefix = "/usr/lib" %}
{% set name = "librdkafka.so.1" %}
{% set source_prefix = "salt://application/cos/pigeon/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
