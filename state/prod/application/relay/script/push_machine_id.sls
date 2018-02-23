push MachineID file:
  file.managed:
    - name: /opt/MachineID
    - source: salt://application/relay/files/MachineID
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test ! -f /opt/MachineID

push rs_test.test file:
  file.managed:
    - name: /usr/lib/rs_test.test
    - source: salt://application/relay/files/rs_test.test
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test ! -f /usr/lib/rs_test.test
