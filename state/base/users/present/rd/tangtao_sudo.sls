grant privilege for tangtao:
  file.managed:
    - name: /etc/sudoers.d/tangtao
    - source: salt://users/files/sudoer/rd/tangtao
    - mode: 440
    - user: root
    - group: root
