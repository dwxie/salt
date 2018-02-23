grant privilege for libingkun:
  file.managed:
    - name: /etc/sudoers.d/libingkun
    - source: salt://users/files/sudoer/rd/libingkun
    - mode: 440
    - user: root
    - group: root
