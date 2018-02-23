absent yuanman sudo file:
  file.absent:
    - name: /etc/sudoers.d/yuanman
    - onlyif:
      - test -f /etc/sudoers.d/yuanman

absent yuanman sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/yuanman/d' /etc/sudoers
