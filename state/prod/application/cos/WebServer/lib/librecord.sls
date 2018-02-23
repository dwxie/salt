{% set prefix = "/usr/lib" %}
{% set name = "librecord.so" %}
{% set source_prefix = "salt://application/cos/WebServer/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
