{% set prefix = "/disk" %}
{% set user = 'root' %}
{% set group = 'root' %}
{% set data = salt['pillar.get']('storage') -%}

{% for partitions in data['partitions'] %}
{% set index = partitions['server_port'] - 9000 %}
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
