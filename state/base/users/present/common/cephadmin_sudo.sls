grant privilege for cephadmin:
  file.managed:
    - name: /etc/sudoers.d/cephadmin
    - source: salt://users/files/sudoer/common/cephadmin
    - mode: 440
    - user: root
    - group: root
