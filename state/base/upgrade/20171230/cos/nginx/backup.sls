{% set prefix = '/opt/nginx' %}
{% set day = '20171230' %}
{% set name = 'nginx' %}
{% set backup_dir = '/backup/cos/nginx' %}

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
