add group for tonychow:
  group.present:
    - name: tonychow

add user for tonychow:
  user.present:
    - name: tonychow
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/tonychow
    - groups:
      - tonychow

create /home/tonychow directory for tonychow:
  file.directory:
    - name: /home/tonychow
    - user: tonychow
    - group: tonychow
    - dir_mode: 755

create .ssh directory for tonychow:
  file.directory:
    - name: /home/tonychow/.ssh
    - user: tonychow
    - group: tonychow
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for tonychow:
  file.managed:
    - name: /home/tonychow/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/tonychow_rsa.pub
    - mode: 400
    - user: tonychow
    - group: tonychow
