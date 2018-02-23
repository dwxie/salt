add group for netposa:
  group.present:
    - name: netposa

add user for netposa:
  user.present:
    - name: netposa
    - fullname: Topvdn Test User
    - shell: /bin/bash
    - home: /home/netposa
    - groups:
      - netposa

create /home/netposa directory for netposa:
  file.directory:
    - name: /home/netposa
    - user: netposa
    - group: netposa
    - dir_mode: 755

create .ssh directory for netposa:
  file.directory:
    - name: /home/netposa/.ssh
    - user: netposa
    - group: netposa
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for netposa:
  file.managed:
    - name: /home/netposa/.ssh/authorized_keys
    - source: salt://users/files/keys/other/netposa_rsa.pub
    - mode: 400
    - user: netposa
    - group: netposa
