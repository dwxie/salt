add group for cephadmin:
  group.present:
    - name: cephadmin

add user for cephadmin:
  user.present:
    - name: cephadmin
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/cephadmin
    - groups:
      - cephadmin

create /home/cephadmin directory for cephadmin:
  file.directory:
    - name: /home/cephadmin
    - user: cephadmin
    - group: cephadmin
    - dir_mode: 755

create .ssh directory for cephadmin:
  file.directory:
    - name: /home/cephadmin/.ssh
    - user: cephadmin
    - group: cephadmin
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for cephadmin:
  file.managed:
    - name: /home/cephadmin/.ssh/authorized_keys
    - source: salt://users/files/keys/common/cephadmin_rsa.pub
    - mode: 400
    - user: cephadmin
    - group: cephadmin

sync id_rsa file for cephadmin:
  file.managed:
    - name: /home/cephadmin/.ssh/id_rsa
    - source: salt://users/files/keys/common/cephadmin_rsa
    - mode: 600
    - user: cephadmin
    - group: cephadmin
