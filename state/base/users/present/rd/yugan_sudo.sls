grant privilege for yugan:
  file.managed:
    - name: /etc/sudoers.d/yugan
    - source: salt://users/files/sudoer/rd/yugan
    - mode: 440
    - user: root
    - group: root
