absent liaodinglan sudo file:
  file.absent:
    - name: /etc/sudoers.d/liaodinglan
    - onlyif:
      - test -f /etc/sudoers.d/liaodinglan
