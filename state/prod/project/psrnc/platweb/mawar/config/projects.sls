{% set prefix = "/var/www" %}
{% set name = "projects.json" %}
{% set source_prefix = "salt://project/psrnc/platweb/mawar/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name}}.origin file:
  file.managed:
    - name: {{ prefix }}/{{ name}}.origin
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja

push json_format.py file:
  file.managed:
    - name: {{ prefix }}/json_format.py
    - source: {{ source_prefix }}/json_format.py
    - mode: 755
    - user: root
    - group: root

run json_format.py script:
  cmd.run:
    - name: python json_format.py {{ name}}.origin {{ name}}
    - cwd: {{ prefix }}
    - onlyif:
      - test -x {{ prefix }}/json_format.py
