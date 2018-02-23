{% set prefix = "/opt/sipserver" %}
{% set name = "sipserver.json" %}
{% set source_prefix = "salt://application/gb/sipserver/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}.origin
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja

push json_format.py file:
  file.managed:
    - name: {{ prefix }}/json_format.py
    - source: salt://tools/files/json_format.py
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}

run json_format.py script:
  cmd.run:
    - name: python json_format.py {{ name }}.origin {{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -x {{ prefix }}/json_format.py
