change mkfs.sh script:
  file.managed:
    - name: /opt/mkfs.sh
    - source: salt://files/mkfs.sh
    - mode: 755
    - user: root
    - group: root
