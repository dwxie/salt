add group for zhaotao:
  group.present:
    - name: zhaotao

add user for zhaotao:
  user.present:
    - name: zhaotao
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/zhaotao
    - groups:
      - zhaotao

create /home/zhaotao directory for zhaotao:
  file.directory:
    - name: /home/zhaotao
    - user: zhaotao
    - group: zhaotao
    - dir_mode: 755

create .ssh directory for zhaotao:
  file.directory:
    - name: /home/zhaotao/.ssh
    - user: zhaotao
    - group: zhaotao
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for zhaotao:
  file.managed:
    - name: /home/zhaotao/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/zhaotao_rsa.pub
    - mode: 400
    - user: zhaotao
    - group: zhaotao
