grant privilege for liuyin:
  file.managed:
    - name: /etc/sudoers.d/liuyin
    - source: salt://users/files/sudoer/ops/liuyin
    - mode: 440
    - user: root
    - group: root
