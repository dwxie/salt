add group for yugan:
  group.present:
    - name: yugan

add user for yugan:
  user.present:
    - name: yugan
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/yugan
    - groups:
      - yugan

create /home/yugan directory for yugan:
  file.directory:
    - name: /home/yugan
    - user: yugan
    - group: yugan
    - dir_mode: 755

create .ssh directory for yugan:
  file.directory:
    - name: /home/yugan/.ssh
    - user: yugan
    - group: yugan
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for yugan:
  file.managed:
    - name: /home/yugan/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/yugan_rsa.pub
    - mode: 400
    - user: yugan
    - group: yugan
