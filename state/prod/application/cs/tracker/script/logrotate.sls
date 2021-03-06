{% set prefix = "/etc/logrotate.d" %}
{% set name = "tracker" %}
{% set source_prefix = "salt://application/cs/tracker/files/logrotate.d" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: root
    - group: root
