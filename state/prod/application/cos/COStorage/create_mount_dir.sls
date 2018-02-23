{% set prefix = "/codisk" %}
{% set user = 'root' %}
{% set group = 'root' %}
{% set data = salt['pillar.get']('cos:COStorage:config') -%}

{% for partitions in data['partitions'] %}
{% set index = partitions['upload_port'] - 9100 %}
create {{ prefix }}/{{ index }} folder:
  file.directory:
    - name: {{ prefix }}/{{ index }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true
    - onlyif:
      - test ! -d {{ prefix }}/{{ index }}
{% endfor %}
