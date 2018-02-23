add group for jump_super:
  group.present:
    - name: jump_super

add user for jump_super:
  user.present:
    - name: jump_super
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/jump_super
    - groups:
      - jump_super

create /home/jump_super directory for jump_super:
  file.directory:
    - name: /home/jump_super
    - user: jump_super
    - group: jump_super
    - dir_mode: 755

create .ssh directory for jump_super:
  file.directory:
    - name: /home/jump_super/.ssh
    - user: jump_super
    - group: jump_super
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for jump_super:
  file.managed:
    - name: /home/jump_super/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/jump_super_rsa.pub
    - mode: 400
    - user: jump_super
    - group: jump_super
