grant privilege for zhaotao:
  file.managed:
    - name: /etc/sudoers.d/zhaotao
    - source: salt://users/files/sudoer/ops/zhaotao
    - mode: 440
    - user: root
    - group: root
