grant privilege for netposa:
  file.managed:
    - name: /etc/sudoers.d/netposa
    - source: salt://users/files/sudoer/other/netposa
    - mode: 440
    - user: root
    - group: root
