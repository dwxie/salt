absent zhangyu sudo file:
  file.absent:
    - name: /etc/sudoers.d/zhangyu
    - onlyif:
      - test -f /etc/sudoers.d/zhangyu

absent zhangyu sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/zhangyu/d' /etc/sudoers
