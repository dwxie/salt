absent wangyi sudo file:
  file.absent:
    - name: /etc/sudoers.d/wangyi
    - onlyif:
      - test -f /etc/sudoers.d/wangyi

absent wangyi sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/wangyi/d' /etc/sudoers
