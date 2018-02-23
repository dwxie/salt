{% set prefix = "/opt/COStorage" %}
{% set name = "costorage.conf" %}
{% set source_prefix = "salt://application/cos/COStorage/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/storage.conf
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
