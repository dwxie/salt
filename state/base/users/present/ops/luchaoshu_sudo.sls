grant privilege for luchaoshu:
  file.managed:
    - name: /etc/sudoers.d/luchaoshu
    - source: salt://users/files/sudoer/ops/luchaoshu
    - mode: 440
    - user: root
    - group: root
