absent weil sudo file:
  file.absent:
    - name: /etc/sudoers.d/weil
    - onlyif:
      - test -f /etc/sudoers.d/weil

absent weil sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/weil/d' /etc/sudoers
