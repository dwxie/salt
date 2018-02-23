push libDStorage{{ pillar['MachineID'] }}.so file:
  file.managed:
    - name: /usr/lib/libDStorage.so
    - source: salt://application/relay/files/libDStorage/libDStorage{{ pillar['MachineID'] }}.so
    - mode: 644
    - user: root
    - group: root

check libDStorage:
  cmd.run:
    - name: ./rs_test.test
    - cwd: /usr/lib
