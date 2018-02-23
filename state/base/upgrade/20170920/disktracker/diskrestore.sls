{% set prefix = '/opt/disktracker' %}
{% set day = '20170920' %}
{% set name = "diskrestore" %}
{% set sha1 = '2f3003c683e4e19a78e2fe3ffd69ab0c65da4d7b' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/upgrade" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ day }}/{{ name }}
    - source_hash: sha1={{ sha1 }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
    - onlf:
      - test -d {{ prefix }}
