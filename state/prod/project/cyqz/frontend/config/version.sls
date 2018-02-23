{% set prefix = '/opt/cyqz_web/app/static/bin' %}
{% set name = '73E1DF12F36D3933E35C8EDC25A35F10.apk' %}
{% set md5 = '73E1DF12F36D3933E35C8EDC25A35F10' %}
{% set source_prefix = "http://114.215.100.47/houtai3" %}
push {{ prefix }}.{{ name }} packet:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - source_hash: md5={{ md5 }}
    - mode: 644
    - user: root
    - group: root
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}

{% set prefix = '/opt/cyqz_web/app/static/version' %}
{% set name = 'version.json' %}
{% set source_prefix = "salt://project/cyqz/frontend/files" %}
push {{ prefix }}.{{ name }} packet:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
