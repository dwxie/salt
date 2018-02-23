add group for liuyin:
  group.present:
    - name: liuyin

add user for liuyin:
  user.present:
    - name: liuyin
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/liuyin
    - groups:
      - liuyin

create /home/liuyin directory for liuyin:
  file.directory:
    - name: /home/liuyin
    - user: liuyin
    - group: liuyin
    - dir_mode: 755

create .ssh directory for liuyin:
  file.directory:
    - name: /home/liuyin/.ssh
    - user: liuyin
    - group: liuyin
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for liuyin:
  file.managed:
    - name: /home/liuyin/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/liuyin_rsa.pub
    - mode: 400
    - user: liuyin
    - group: liuyin
