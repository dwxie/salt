{% set prefix = '/opt/disktracker' %}
{% set day = '20170920' %}
{% set name = "groupclean" %}
{% set sha1 = '04ee7e0407a442ac92bb47300639890668b4e8ab' %}
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
