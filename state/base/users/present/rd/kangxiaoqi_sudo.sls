grant privilege for kangxiaoqi:
  file.managed:
    - name: /etc/sudoers.d/kangxiaoqi
    - source: salt://users/files/sudoer/rd/kangxiaoqi
    - mode: 440
    - user: root
    - group: root
