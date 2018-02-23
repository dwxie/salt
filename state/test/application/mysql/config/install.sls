# install source mysql
{% set prefix = '/usr/local/services' %}
{% set package = 'mysql-5.5.49.tar.gz' %}
{% set sha256 = '0c766a27a94193164df60f25c003fe5f1d4534bee288349dd551687d320f6bab' %}

create mysql user:
  user.present:
    - name: mysql
    - uid: 1024
    - createhome: False
    - gid_from_name: True
    - shell: /sbin/nologin
    - unless:
      - grep 'mysql' /etc/passwd                        # if exist then do not add user

install required package:
  pkg.installed:
    - pkgs:
      - openssl
      - libncurses5-dev
      - libssl-dev
      - xtrabackup
      
make {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - mode: 644
    - makedirs: ture
    - unless: test -d {{ prefix }}

push {{ package }} file:
  file.managed:
    - name: {{ prefix }}/{{ package }}
    - source: http://42.51.7.46/compiled/mysql/mysql-5.5.49.tar.gz
    - source_hash: sha256 = {{ sha256 }}
    - cwd: {{ prefix }}
    - mode: 644
    - user: root
    - group: root

unpack {{ package }} file:
  cmd.run:
    - name: tar xf {{ prefix }}/{{ package }}
    - cwd: {{ prefix }}
    - unless: test -d {{ prefix }}/mysql-5.5.49

make mysql softlink:
  cmd.run:
    - name: ln -s {{ prefix }}/mysql-5.5.49 {{ prefix }}/mysql
    - unless: test -e {{ prefix }}/mysql

change owner to mysql:
  cmd.run:
    - names:
      - chown mysql:mysql {{ prefix }}/mysql-5.5.49 -R
      - chown mysql:mysql {{ prefix }}/mysql -R

push mysql config file:
  file.managed:
    - name: {{ prefix }}/mysql/my.cnf
    - source: salt://application/mysql/files/mysql.conf.jinja
    - user: mysql
    - group: mysql
    - mode: 644
    - template: jinja
