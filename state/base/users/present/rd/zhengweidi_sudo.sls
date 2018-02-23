grant privilege for zhengweidi:
  file.managed:
    - name: /etc/sudoers.d/zhengweidi
    - source: salt://users/files/sudoer/rd/zhengweidi
    - mode: 440
    - user: root
    - group: root
