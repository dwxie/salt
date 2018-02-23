{% set prefix = "/tmp" %}
{% set name = "camera.env" %}
{% set source_prefix = "salt://application/platweb/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - onlf:
      - test -f {{ prefix }}/{{ name }}
