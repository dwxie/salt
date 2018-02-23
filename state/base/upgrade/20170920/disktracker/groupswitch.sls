{% set prefix = '/opt/disktracker' %}
{% set day = '20170920' %}
{% set name = "groupswitch" %}
{% set sha1 = 'a236565e0581346d7f36b59d51baff3b7dde0d67' %}
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
