{% set prefix = "/opt/disktracker" %}
{% set name = "disktracker.ini" %}
{% set source_prefix = "salt://project/psrnc/disktracker/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

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
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
