{% set prefix = '/opt/disktracker' %}
{% set day = '20170920' %}
{% set backup_dir = '/backup/disktracker' %}

create {{ backup_dir }} folder:
  file.directory:
    - name: {{ backup_dir }}/{{ day }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

{% set name = 'disktracker' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set name = 'diskconfig' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set name = 'diskgroup' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}
