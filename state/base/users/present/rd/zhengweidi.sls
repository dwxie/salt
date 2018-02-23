add group for zhengweidi:
  group.present:
    - name: zhengweidi

add user for zhengweidi:
  user.present:
    - name: zhengweidi
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/zhengweidi
    - groups:
      - zhengweidi

create /home/zhengweidi directory for zhengweidi:
  file.directory:
    - name: /home/zhengweidi
    - user: zhengweidi
    - group: zhengweidi
    - dir_mode: 755

create .ssh directory for zhengweidi:
  file.directory:
    - name: /home/zhengweidi/.ssh
    - user: zhengweidi
    - group: zhengweidi
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for zhengweidi:
  file.managed:
    - name: /home/zhengweidi/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/zhengweidi_rsa.pub
    - mode: 400
    - user: zhengweidi
    - group: zhengweidi
