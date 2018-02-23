grant privilege for topvdn:
  file.managed:
    - name: /etc/sudoers.d/topvdn
    - source: salt://users/files/sudoer/common/topvdn
    - mode: 440
    - user: root
    - group: root
