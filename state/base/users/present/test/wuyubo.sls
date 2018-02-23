add group for wuyubo:
  group.present:
    - name: wuyubo

add user for wuyubo:
  user.present:
    - name: wuyubo
    - fullname: Topvdn Test User
    - shell: /bin/bash
    - home: /home/wuyubo
    - groups:
      - wuyubo

create /home/wuyubo directory for wuyubo:
  file.directory:
    - name: /home/wuyubo
    - user: wuyubo
    - group: wuyubo
    - dir_mode: 755

create .ssh directory for wuyubo:
  file.directory:
    - name: /home/wuyubo/.ssh
    - user: wuyubo
    - group: wuyubo
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for wuyubo:
  file.managed:
    - name: /home/wuyubo/.ssh/authorized_keys
    - source: salt://users/files/keys/test/wuyubo_rsa.pub
    - mode: 400
    - user: wuyubo
    - group: wuyubo
