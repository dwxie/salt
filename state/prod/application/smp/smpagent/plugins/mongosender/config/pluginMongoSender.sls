{% set prefix = "/opt/smpagent/plugins/mongosender" %}
{% set name = "pluginMongoSender.yaml" %}
{% set source_prefix = "salt://application/smp/smpagent/plugins/mongosender/files" %}
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
