{% set prefix = "/opt/smpagent/plugins/etc" %}
{% set name = "collector.yaml" %}
{% set source_prefix = "salt://application/smp/smpagent/plugins/collector/files" %}
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
