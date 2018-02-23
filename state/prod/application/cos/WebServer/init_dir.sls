{% set data = salt['pillar.get']('cos:WebServer:config') %}
{% set user = 'root' %}
{% set group = 'root' %}

{% for storagepath in data['diskServer']['storagepaths'] %}
create {{ storagepath['storageroot'] }} folder:
  file.directory:
    - name: {{ storagepath['storageroot'] }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true
    - onlyif:
      - test ! -d {{ storagepath['storageroot'] }}
{% endfor %}
