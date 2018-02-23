{% set prefix = '/opt/nginx-tool/sbin' %}
{% set day = '20180112' %}
{% set name = 'nginx' %}
{% set sha1 = 'bb57d50140a63a115ec1a985a6a733614b0b7cf9' %}
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
