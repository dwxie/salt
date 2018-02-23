# make softlinks and
#
{% set prefix = '/usr/local/services/mysql' %}

make data directory:
  file.directory:
    - name: /data/mysql
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true

make basedir softlink:
  cmd.run:
    - name: ln -s /data/mysql {{ prefix }}/var

mkdir binlog directory:
  file.directory:
    - name: {{ prefix }}/var/binlog
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true
    - unless: test -d {{ prefix }}/var/binlog

mkdir redolog directory:
  file.directory:
    - name: {{ prefix }}/var/redolog
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true
    - unless: test -d {{ prefix }}/var/redolog

mkdir baselog directory:
  file.directory:
    - name: {{ prefix }}/var/logs
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true
    - unless: test -d {{ prefix }}/var/logs

mkdir basedata directory:
  file.directory:
    - name: {{ prefix }}/var/data
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true
    - unless: test -d {{ prefix }}/var/data

mkdir relaylog directory:
  file.directory:
    - name: {{ prefix }}/var/relaylog
    - user: mysql
    - group: mysql
    - dir_mode: 755
    - makedirs: true
    - unless: test -d {{ prefix }}/var/relaylog
