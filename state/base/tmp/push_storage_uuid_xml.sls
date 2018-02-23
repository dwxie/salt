change mkfs.sh script:
  file.managed:
    - name: /opt/storage_uuid_xml.py
    - source: salt://files/storage_uuid_xml.py
    - mode: 755
    - user: root
    - group: root
