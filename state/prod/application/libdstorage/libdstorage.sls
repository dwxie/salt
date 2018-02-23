{% set prefix = "/usr/lib" %}
{% set name = "libDStorage.so" %}
{% set source_prefix = "salt://application/libdstorage/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/libDStorage{{ pillar['MachineID'] }}.so
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}

check {{ prefix }}/{{ name }} file:
  cmd.run:
    - name: ./rs_test.test
    - cwd: {{ prefix }}
