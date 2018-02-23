add group for kangxiaoqi:
  group.present:
    - name: kangxiaoqi

add user for kangxiaoqi:
  user.present:
    - name: kangxiaoqi
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/kangxiaoqi
    - groups:
      - kangxiaoqi

create /home/kangxiaoqi directory for kangxiaoqi:
  file.directory:
    - name: /home/kangxiaoqi
    - user: kangxiaoqi
    - group: kangxiaoqi
    - dir_mode: 755

create .ssh directory for kangxiaoqi:
  file.directory:
    - name: /home/kangxiaoqi/.ssh
    - user: kangxiaoqi
    - group: kangxiaoqi
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for kangxiaoqi:
  file.managed:
    - name: /home/kangxiaoqi/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/kangxiaoqi_rsa.pub
    - mode: 400
    - user: kangxiaoqi
    - group: kangxiaoqi
