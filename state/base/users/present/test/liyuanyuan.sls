add group for liyuanyuan:
  group.present:
    - name: liyuanyuan

add user for liyuanyuan:
  user.present:
    - name: liyuanyuan
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/liyuanyuan
    - groups:
      - liyuanyuan

create /home/liyuanyuan directory for liyuanyuan:
  file.directory:
    - name: /home/liyuanyuan
    - user: liyuanyuan
    - group: liyuanyuan
    - dir_mode: 755

create .ssh directory for liyuanyuan:
  file.directory:
    - name: /home/liyuanyuan/.ssh
    - user: liyuanyuan
    - group: liyuanyuan
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for liyuanyuan:
  file.managed:
    - name: /home/liyuanyuan/.ssh/authorized_keys
    - source: salt://users/files/keys/test/liyuanyuan_rsa.pub
    - mode: 400
    - user: liyuanyuan
    - group: liyuanyuan
