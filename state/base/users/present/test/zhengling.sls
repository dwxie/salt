add group for zhengling:
  group.present:
    - name: zhengling

add user for zhengling:
  user.present:
    - name: zhengling
    - fullname: Topvdn Test User
    - shell: /bin/bash
    - home: /home/zhengling
    - groups:
      - zhengling

create /home/zhengling directory for zhengling:
  file.directory:
    - name: /home/zhengling
    - user: zhengling
    - group: zhengling
    - dir_mode: 755

create .ssh directory for zhengling:
  file.directory:
    - name: /home/zhengling/.ssh
    - user: zhengling
    - group: zhengling
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for zhengling:
  file.managed:
    - name: /home/zhengling/.ssh/authorized_keys
    - source: salt://users/files/keys/test/zhengling_rsa.pub
    - mode: 400
    - user: zhengling
    - group: zhengling
