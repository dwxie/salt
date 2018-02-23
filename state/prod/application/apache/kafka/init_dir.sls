{% set data = salt['pillar.get']('apache:kafka:config:server') %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ data['log']['dirs'] }} folder:
  file.directory:
    - name: {{ data['log']['dirs'] }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true
    - onlyif:
      - test ! -d {{ data['log']['dirs'] }}
