{% set prefix = '/opt' %}
{% set day = '20171226' %}
{% set name = 'codisktracker' %}
{% set backup_dir = '/backup/cos/codisktracker' %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ backup_dir }} folder:
  file.directory:
    - name: {{ backup_dir }}/{{ day }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true

backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -av --exclude="/log/*" --exclude="/log_dg/*" {{ prefix }}/{{ name }}/ {{ backup_dir }}/{{ day }}/{{ name }}/
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ name }}
      - test ! -d {{ backup_dir }}/{{ day }}/{{ name }}
