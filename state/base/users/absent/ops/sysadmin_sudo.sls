absent sysadmin sudo file:
  file.absent:
    - name: /etc/sudoers.d/sysadmin
    - onlyif:
      - test -f /etc/sudoers.d/sysadmin

absent sysadmin sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/sysadmin/d' /etc/sudoers
