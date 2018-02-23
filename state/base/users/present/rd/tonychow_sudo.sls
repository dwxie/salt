grant privilege for tonychow:
  file.managed:
    - name: /etc/sudoers.d/tonychow
    - source: salt://users/files/sudoer/rd/tonychow
    - mode: 440
    - user: root
    - group: root
