{% set prefix = '/home/tangtao/tracker' %}
{% set name = "relay_group_info.ini" %}
{% set source_prefix = "salt://application/cs/tracker/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - onlf:
      - test -d {{ prefix }}
