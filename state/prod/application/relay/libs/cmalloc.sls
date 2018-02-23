{% set prefix = "/usr/lib" %}
{% set name = "libtcmalloc.so.4" %}

push {{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: salt://application/relay/files/{{ name }}
    - mode: 644
    - user: root
    - group: root