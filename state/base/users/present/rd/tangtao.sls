add group for tangtao:
  group.present:
    - name: tangtao

add user for tangtao:
  user.present:
    - name: tangtao
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/tangtao
    - groups:
      - tangtao

create /home/tangtao directory for tangtao:
  file.directory:
    - name: /home/tangtao
    - user: tangtao
    - group: tangtao
    - dir_mode: 755

create .ssh directory for tangtao:
  file.directory:
    - name: /home/tangtao/.ssh
    - user: tangtao
    - group: tangtao
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for tangtao:
  file.managed:
    - name: /home/tangtao/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/tangtao_rsa.pub
    - mode: 400
    - user: tangtao
    - group: tangtao
