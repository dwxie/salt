{% set prefix = "/var/www/index_web/libs/remuxing" %}
{% set name = "libremuxing.so" %}
{% set version = "4.3.0" %}
{% set source_prefix = "salt://application/cs/zone/index_web/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }}.{{ version }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}.{{ version }}
    - source: {{ source_prefix }}/{{ name }}.{{ version }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}

create a symbolic link from {{ prefix }}/{{ name }}.{{ version }} to {{ prefix }}/{{ name }}:
  file.symlink:
    - name: {{ prefix }}/{{ name }}
    - target: {{ name }}.{{ version }}
    - force: True
    - user: {{ user }}
    - group: {{ group }}
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}
      - test -f {{ prefix }}/{{ name }}.{{ version }}
