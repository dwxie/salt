grant privilege for liyuanyuan:
  file.managed:
    - name: /etc/sudoers.d/liyuanyuan
    - source: salt://users/files/sudoer/test/liyuanyuan
    - mode: 440
    - user: root
    - group: root
