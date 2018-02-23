{% set prefix = '/opt/codproducer' %}
{% set day = '20171226' %}
{% set name = 'codproducer' %}
{% set backup_dir = '/backup/cos/codproducer' %}

create {{ backup_dir }} folder:
  file.directory:
    - name: {{ backup_dir }}/{{ day }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}
