{% set prefix = "/opt/CODisktracker" %}
{% set name = "CODisktracker.ini" %}
{% set source_prefix = "salt://application/cos/CODisktracker/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/disktracker.ini
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
