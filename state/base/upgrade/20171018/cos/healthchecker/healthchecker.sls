{% set prefix = '/opt/healthchecker' %}
{% set day = '20171018' %}
{% set name = 'healthchecker' %}
{% set sha1 = '3123cece6e68b741c56ebf3969cff2a2f1f6b0a0' %}
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
