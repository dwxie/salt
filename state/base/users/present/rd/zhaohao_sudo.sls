grant privilege for zhaohao:
  file.managed:
    - name: /etc/sudoers.d/zhaohao
    - source: salt://users/files/sudoer/rd/zhaohao
    - mode: 440
    - user: root
    - group: root
