absent liyuanyuan sudo file:
  file.absent:
    - name: /etc/sudoers.d/liyuanyuan
    - onlyif:
      - test -f /etc/sudoers.d/liyuanyuan
