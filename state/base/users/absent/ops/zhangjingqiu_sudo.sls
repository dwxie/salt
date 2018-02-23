absent zhangjingqiu sudo file:
  file.absent:
    - name: /etc/sudoers.d/zhangjingqiu
    - onlyif:
      - test -f /etc/sudoers.d/zhangjingqiu

absent zhangjingqiu sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/zhangjingqiu/d' /etc/sudoers
