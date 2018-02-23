push /opt/ubuntu_mac_bind.sh file:
  file.managed:
    - name: /opt/ubuntu_mac_bind_v2.sh
    - source: salt://base/files/ubuntu_mac_bind_v2.sh
    - mode: 754
    - user: root
    - group: root
