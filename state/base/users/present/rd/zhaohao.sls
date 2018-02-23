add group for zhaohao:
  group.present:
    - name: zhaohao

add user for zhaohao:
  user.present:
    - name: zhaohao
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/zhaohao
    - groups:
      - zhaohao

create /home/zhaohao directory for zhaohao:
  file.directory:
    - name: /home/zhaohao
    - user: zhaohao
    - group: zhaohao
    - dir_mode: 755

create .ssh directory for zhaohao:
  file.directory:
    - name: /home/zhaohao/.ssh
    - user: zhaohao
    - group: zhaohao
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for zhaohao:
  file.managed:
    - name: /home/zhaohao/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/zhaohao_rsa.pub
    - mode: 400
    - user: zhaohao
    - group: zhaohao
