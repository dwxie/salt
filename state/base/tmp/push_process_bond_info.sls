# for bond camera
make old config file dir:
  file.directory:
    - name: /opt/tracker/config/oldfile
    - mode: 644
    - user: root
    - group: 755
    - makedirs: True

push process_bond_info.py script:
  file.managed:
    - name: /opt/tracker/process_bond_info.py
    - source: salt://tmp/process_bond_info.py
    - mode: 755
    - user: root
    - group: root
