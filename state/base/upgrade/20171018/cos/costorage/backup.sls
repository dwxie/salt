{% set prefix = '/opt/COStorage' %}
{% set day = '20171018' %}
{% set name = 'COStorage' %}
{% set backup_dir = '/backup/cos/COStorage' %}

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
