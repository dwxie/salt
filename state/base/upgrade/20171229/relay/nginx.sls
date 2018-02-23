{% set prefix = '/opt/nginx-tool/sbin' %}
{% set day = '20171229' %}
{% set name = 'nginx' %}
{% set sha1 = '7b233ba9a2ef3bfe3d2d9e7420dc0b94e1b8bce5' %}
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
