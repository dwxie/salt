{% set prefix = "/opt/codisktracker/tool/dbMigrationTool" %}
{% set name = "dbmigrationtool.yaml" %}
{% set source_prefix = "salt://application/cos/codisktracker/tool/dbMigrationTool/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
