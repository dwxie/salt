grant privilege for mengxiangyi:
  file.managed:
    - name: /etc/sudoers.d/mengxiangyi
    - source: salt://users/files/sudoer/test/mengxiangyi
    - mode: 440
    - user: root
    - group: root
