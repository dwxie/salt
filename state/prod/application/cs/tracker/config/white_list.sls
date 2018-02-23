{% set prefix = "/opt/tracker/config" %}
{% set name = "white_list.json" %}
{% set source_prefix = "salt://application/cs/tracker/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }}.origin file:
  file.managed:
    - name: {{ prefix }}/{{ name }}.origin
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja

format {{ prefix }}/{{ name }}.origin to {{ prefix }}/{{ name }}:
  cmd.run:
    - name: python json_format.py {{ prefix }}/{{ name }}.origin {{ prefix }}/{{ name }}
    - cwd: {{ prefix }}/..
    - onlyif:
      - test -x {{ prefix }}/../json_format.py
