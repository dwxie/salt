change manual_mkfs.sh script:
  file.managed:
    - name: /opt/manual_mkfs.sh
    - source: salt://files/manual_mkfs.sh
    - mode: 755
    - user: root
    - group: root
