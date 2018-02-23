absent luoyuanyong sudo file:
  file.absent:
    - name: /etc/sudoers.d/luoyuanyong
    - onlyif:
      - test -f /etc/sudoers.d/luoyuanyong

absent luoyuanyong sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/luoyuanyong/d' /etc/sudoers
