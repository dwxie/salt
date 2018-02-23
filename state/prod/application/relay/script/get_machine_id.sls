get MachineID:
  cmd.run:
    - name: /opt/MachineID
    - cwd: /opt
    - onlyif:
      - test -f /opt/MachineID
