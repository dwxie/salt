add group for mengxiangyi:
  group.present:
    - name: mengxiangyi

add user for mengxiangyi:
  user.present:
    - name: mengxiangyi
    - fullname: Topvdn Test User
    - shell: /bin/bash
    - home: /home/mengxiangyi
    - groups:
      - mengxiangyi

create /home/mengxiangyi directory for mengxiangyi:
  file.directory:
    - name: /home/mengxiangyi
    - user: mengxiangyi
    - group: mengxiangyi
    - dir_mode: 755

create .ssh directory for mengxiangyi:
  file.directory:
    - name: /home/mengxiangyi/.ssh
    - user: mengxiangyi
    - group: mengxiangyi
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for mengxiangyi:
  file.managed:
    - name: /home/mengxiangyi/.ssh/authorized_keys
    - source: salt://users/files/keys/test/mengxiangyi_rsa.pub
    - mode: 400
    - user: mengxiangyi
    - group: mengxiangyi
