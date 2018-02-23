add group for operator2:
  group.present:
    - name: operator2

add user for operator2:
  user.present:
    - name: operator2
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/operator2
    - groups:
      - operator2

create /home/operator2 directory for operator2:
  file.directory:
    - name: /home/operator2
    - user: operator2
    - group: operator2
    - dir_mode: 755

create .ssh directory for operator2:
  file.directory:
    - name: /home/operator2/.ssh
    - user: operator2
    - group: operator2
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for operator2:
  file.managed:
    - name: /home/operator2/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/operator2_rsa.pub
    - mode: 400
    - user: operator2
    - group: operator2
