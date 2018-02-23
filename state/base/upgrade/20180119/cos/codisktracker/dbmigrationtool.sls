{% set prefix = '/opt/codisktracker/tool/dbMigrationTool' %}
{% set day = '20180119' %}
{% set name = 'dbmigrationtool' %}
{% set sha1 = '9e8980ac393ef5767132f57ef2209cae11f84950' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/upgrade" %}

push {{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ day }}/{{ name }}
    - source_hash: sha1={{ sha1 }}
    - mode: 755
    - user: root
    - group: root

print {{ name }} md5sum:
  cmd.run:
    - name: /usr/bin/md5sum {{ name }}
    - cwd: {{ prefix }}
