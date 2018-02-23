{% set prefix = '/opt/healthchecker' %}
{% set day = '20180119' %}
{% set name = 'healthchecker' %}
{% set sha1 = '88a6fbe538e0cc1f2c9b2fa2487f1f5029e842eb' %}
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
