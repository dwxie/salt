grant privilege for suwei:
  file.managed:
    - name: /etc/sudoers.d/suwei
    - source: salt://users/files/sudoer/rd/suwei
    - mode: 440
    - user: root
    - group: root
