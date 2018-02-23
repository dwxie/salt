{% set day = '20171229' %}
{% set backup_dir = '/backup/relay' %}

create {{ backup_dir }} folder:
  file.directory:
    - name: {{ backup_dir }}/{{ day }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

{% set prefix = '/opt/nginx-tool/sbin' %}
{% set name = 'nginx' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set name = 'config.json' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set name = 'messageRecovery' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set name = 'check_json' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}

{% set prefix = '/opt/nginx-tool/conf' %}
{% set name = 'nginx.conf' %}
backup {{ prefix }}/{{ name }} to {{ backup_dir }}/{{ day }}/{{ name }}:
  cmd.run:
    - name: /usr/bin/rsync -a {{ prefix }}/{{ name }} {{ backup_dir }}/{{ day }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
      - test ! -f {{ backup_dir }}/{{ day }}/{{ name }}
