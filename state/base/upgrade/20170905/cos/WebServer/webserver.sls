{% set prefix = '/opt/WebServer' %}
{% set day = '20170905' %}
{% set name = 'webserver' %}
{% set sha1 = '8db27ae58bd6d5df54d5048a1c1dff9020fa7b33' %}
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
