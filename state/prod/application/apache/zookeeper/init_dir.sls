{% set data = salt['pillar.get']('apache:zookeeper:config:zoo') %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ data['dataDir'] }} folder:
  file.directory:
    - name: {{ data['dataDir'] }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true
    - onlyif:
      - test ! -d {{ data['dataDir'] }}
