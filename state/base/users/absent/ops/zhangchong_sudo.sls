absent zhangchong sudo file:
  file.absent:
    - name: /etc/sudoers.d/zhangchong
    - onlyif:
      - test -f /etc/sudoers.d/zhangchong

absent zhangchong sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/zhangchong/d' /etc/sudoers
