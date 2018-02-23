grant privilege for zhengling:
  file.managed:
    - name: /etc/sudoers.d/zhengling
    - source: salt://users/files/sudoer/test/zhengling
    - mode: 440
    - user: root
    - group: root
