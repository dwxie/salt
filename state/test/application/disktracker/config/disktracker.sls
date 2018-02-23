{%set prefix = '/tmp/disktracker_test' %}
{% set name = "disktracker.ini" %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: salt://application/disktracker/files/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
