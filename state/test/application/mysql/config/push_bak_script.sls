# push mysql xtrabackup script
{% set prefix = '/usr/local/services/mysql/mysqldump' %}

make {{ prefix }} directory:
  file.directory:
    - name: {{ prefix }}
    - user: mysql
    - group: mysql
    - dir_mode: 644
    - makedirs: true
    - unless: test -d {{ prefix }}

push mysql xtrabackup full backup script:
  file.managed:
    - name: {{ prefix }}/xtrabackup_full.sh
    - source: salt://application/mysql/files/xtrabackup_full.sh
    - mode: 700
    - user: root
    - group: root
    - unless: test ! -e {{ prefix }}

push mysql xtrabackup part backup script:
  file.managed:
    - name: {{ prefix }}/xtrabackup_part.sh
    - source: salt://application/mysql/files/xtrabackup_part.sh
    - mode: 700
    - user: root
    - group: root
    - unless: test ! -e {{ prefix }}

push mysql xtrabackup recover script:
  file.managed:
    - name: {{ prefix }}/xtrarecover.sh
    - source: salt://application/mysql/files/xtrarecover.sh
    - mode: 700
    - user: root
    - group: root
    - unless: test ! -e {{ prefix }}
 
