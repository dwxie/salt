add group for libingkun:
  group.present:
    - name: libingkun

add user for libingkun:
  user.present:
    - name: libingkun
    - fullname: Topvdn Dev User
    - shell: /bin/bash
    - home: /home/libingkun
    - groups:
      - libingkun

create /home/libingkun directory for libingkun:
  file.directory:
    - name: /home/libingkun
    - user: libingkun
    - group: libingkun
    - dir_mode: 755

create .ssh directory for liaodinglan:
  file.directory:
    - name: /home/libingkun/.ssh
    - user: libingkun
    - group: libingkun
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for libingkun:
  file.managed:
    - name: /home/libingkun/.ssh/authorized_keys
    - source: salt://users/files/keys/rd/libingkun_rsa.pub
    - mode: 400
    - user: libingkun
    - group: libingkun
