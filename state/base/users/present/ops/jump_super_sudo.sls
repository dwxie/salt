grant privilege for jump_super:
  file.managed:
    - name: /etc/sudoers.d/jump_super
    - source: salt://users/files/sudoer/ops/jump_super
    - mode: 440
    - user: root
    - group: root
