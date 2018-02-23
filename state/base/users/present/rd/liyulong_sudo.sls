grant privilege for liyulong:
  file.managed:
    - name: /etc/sudoers.d/liyulong
    - source: salt://users/files/sudoer/rd/liyulong
    - mode: 440
    - user: root
    - group: root
