grant privilege for operator1:
  file.managed:
    - name: /etc/sudoers.d/operator1
    - source: salt://users/files/sudoer/ops/operator1
    - mode: 440
    - user: root
    - group: root
