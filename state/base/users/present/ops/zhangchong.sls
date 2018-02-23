add group for zhangchong:
  group.present:
    - name: zhangchong

add user for zhangchong:
  user.present:
    - name: zhangchong
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/zhangchong
    - groups:
      - zhangchong

create /home/zhangchong directory for zhangchong:
  file.directory:
    - name: /home/zhangchong
    - user: zhangchong
    - group: zhangchong
    - dir_mode: 755

create .ssh directory for zhangchong:
  file.directory:
    - name: /home/zhangchong/.ssh
    - user: zhangchong
    - group: zhangchong
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for zhangchong:
  file.managed:
    - name: /home/zhangchong/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/zhangchong_rsa.pub
    - mode: 400
    - user: zhangchong
    - group: zhangchong
