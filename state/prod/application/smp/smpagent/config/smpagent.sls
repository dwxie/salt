{% set prefix = "/opt/smpagent" %}
{% set name = "smpagent.yaml" %}
{% set source_prefix = "salt://application/smp/smpagent/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
