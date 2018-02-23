add group for liyulong:
  group.present:
    - name: liyulong

add user for liyulong:
  user.present:
    - name: liyulong
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/liyulong
    - groups:
      - liyulong

create /home/liyulong directory for liyulong:
  file.directory:
    - name: /home/liyulong
    - user: liyulong
    - group: liyulong
    - dir_mode: 755

create .ssh directory for liyulong:
  file.directory:
    - name: /home/liyulong/.ssh
    - user: liyulong
    - group: liyulong
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for liyulong:
  file.managed:
    - name: /home/liyulong/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/liyulong_rsa.pub
    - mode: 400
    - user: liyulong
    - group: liyulong
