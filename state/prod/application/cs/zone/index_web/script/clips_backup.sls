{% set prefix = "/opt/sa_tools/scripts/sh" %}
{% set source_prefix = "salt://application/cs/zone/index_web/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

{% set name = "clips_backup.sh" %}
push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}

{% set name = "clips_exclude.list" %}
push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
