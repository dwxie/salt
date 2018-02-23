{% set prefix = "/tmp" %}

push config.json.origin file:
  file.managed:
    - name: {{ prefix }}/config.json.origin
    - source: salt://application/relay/files/config.json.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja

push json_format.py file:
  file.managed:
    - name: {{ prefix }}/json_format.py
    - source: salt://application/relay/files/json_format.py
    - mode: 755
    - user: root
    - group: root

run json_format.py script:
  cmd.run:
    - name: python json_format.py
    - cwd: {{ prefix }}
    - onlyif:
      - test -x {{ prefix }}/json_format.py
