grant privilege for wuyubo:
  file.managed:
    - name: /etc/sudoers.d/wuyubo
    - source: salt://users/files/sudoer/test/wuyubo
    - mode: 440
    - user: root
    - group: root
