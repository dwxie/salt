{% set prefix = "/usr/lib" %}
{% set name = "rs_test.test" %}
{% set source_prefix = "salt://application/libdstorage/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}
