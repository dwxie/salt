{% set prefix = '/opt/nginx-tool/sbin' %}
{% set day = '20180119' %}
{% set name = 'messageRecovery' %}
{% set sha1 = '55bed8a68d8f8fb848adfd55e41556d0b1248b17' %}
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
