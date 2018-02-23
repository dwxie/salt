grant privilege for zhangchong:
  file.managed:
    - name: /etc/sudoers.d/zhangchong
    - source: salt://users/files/sudoer/ops/zhangchong
    - mode: 440
    - user: root
    - group: root
