push /opt/ubuntu_bond.sh file:
  file.managed:
    - name: /opt/ubuntu_bond_v2.sh
    - source: salt://base/files/ubuntu_bond_v2.sh
    - mode: 754
    - user: root
    - group: root
