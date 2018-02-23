add group for luchaoshu:
  group.present:
    - name: luchaoshu

add user for luchaoshu:
  user.present:
    - name: luchaoshu
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/luchaoshu
    - groups:
      - luchaoshu

create /home/luchaoshu directory for luchaoshu:
  file.directory:
    - name: /home/luchaoshu
    - user: luchaoshu
    - group: luchaoshu
    - dir_mode: 755

create .ssh directory for luchaoshu:
  file.directory:
    - name: /home/luchaoshu/.ssh
    - user: luchaoshu
    - group: luchaoshu
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for luchaoshu:
  file.managed:
    - name: /home/luchaoshu/.ssh/authorized_keys
    - source: salt://users/files/keys/ops/luchaoshu_rsa.pub
    - mode: 400
    - user: luchaoshu
    - group: luchaoshu
