{% set prefix = "/opt/tracker/config" %}
{% set name = "logging.conf" %}
{% set source_prefix = "salt://application/cs/tracker/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
