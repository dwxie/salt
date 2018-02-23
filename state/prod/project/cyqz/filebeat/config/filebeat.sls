{% set prefix = "/etc/filebeat" %}
{% set name = "filebeat.yml" %}
{% set source_prefix = "salt://project/cyqz/filebeat/files" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
