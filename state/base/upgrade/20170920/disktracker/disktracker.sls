{% set prefix = '/opt/disktracker' %}
{% set day = '20170920' %}
{% set name = "disktracker" %}
{% set sha1 = '4dcb013060b074992b489480bc96027d6f485a00' %}
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
