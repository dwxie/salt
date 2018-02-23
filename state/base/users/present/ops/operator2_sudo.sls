grant privilege for operator2:
  file.managed:
    - name: /etc/sudoers.d/operator2
    - source: salt://users/files/sudoer/ops/operator2
    - mode: 440
    - user: root
    - group: root
