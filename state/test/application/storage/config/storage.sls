{% set prefix = '/tmp/storage_test' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push storage.conf file:
  file.managed:
    - name: {{ prefix }}/storage.conf
    - source: salt://application/storage/files/storage.conf.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
