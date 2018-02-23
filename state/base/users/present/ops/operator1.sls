add group for operator1:
  group.present:
    - name: operator1

add user for operator1:
  user.present:
    - name: operator1
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/operator1
    - groups:
      - operator1

create /home/operator1 directory for operator1:
  file.directory:
    - name: /home/operator1
    - user: operator1
    - group: operator1
    - dir_mode: 755

create .ssh directory for operator1:
  file.directory:
    - name: /home/operator1/.ssh
    - user: operator1
    - group: operator1
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for operator1:
  file.managed:
    - name: /home/operator1/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/operator1_rsa.pub
    - mode: 400
    - user: operator1
    - group: operator1
