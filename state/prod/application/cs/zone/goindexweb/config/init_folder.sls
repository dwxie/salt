{% set data = salt['pillar.get']('cs:zone:goindexweb:config') %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ data['record']['flv_path'] }} folder:
  file.directory:
    - name: {{ data['record']['flv_path'] }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true

create {{ data['record']['ts_path'] }} folder:
  file.directory:
    - name: {{ data['record']['ts_path'] }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true
