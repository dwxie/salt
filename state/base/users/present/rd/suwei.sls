add group for suwei:
  group.present:
    - name: suwei

add user for suwei:
  user.present:
    - name: suwei
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/suwei
    - groups:
      - suwei

create /home/suwei directory for suwei:
  file.directory:
    - name: /home/suwei
    - user: suwei
    - group: suwei
    - dir_mode: 755

create .ssh directory for suwei:
  file.directory:
    - name: /home/suwei/.ssh
    - user: suwei
    - group: suwei
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for suwei:
  file.managed:
    - name: /home/suwei/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/suwei_rsa.pub
    - mode: 400
    - user: suwei
    - group: suwei
