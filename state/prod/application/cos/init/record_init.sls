{% set prefix = '/etc/mongodb' %}
{% set name = "record_init.js" %}
{% set sha1 = 'f09d858f5255eae5dd072b252fb71c5cb9f06978' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/packets/cos" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - source_hash: sha1={{ sha1 }}
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
    - onlf:
      - test -d {{ prefix }}
